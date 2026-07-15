# Utilities-flutter (`u` v1.5.0) — Full Audit Report

_Prepared before any code changes. Scope: the `u`
package + `ava_hamrah_flutter` + `u_admin_flutter`. Workflow agreed: files-only edits (you handle
git/submodule sync), incremental changes with review as we go._

> **Toolchain note:** the sandbox has no Dart/Flutter SDK, so this audit is by source reading and
> pattern analysis, not a compiler/`flutter analyze` pass. Anything marked "suspected bug" should be
> confirmed by an analyzer run on your machine before/after the fix.

---

## 1. How everything fits together

- The package is named **`u`** (`import "package:u/utilities.dart";`), version **1.5.0**.
  `utilities.dart` is a single barrel with **148 exports** — it re-exports Flutter, GetX, http,
  syncfusion, etc., plus every component/util/service. Importing that one file gives you the whole
  toolkit.
- **Both apps consume it as a git submodule** (`path: Utilities-flutter` in each `pubspec.yaml`,
  pulled from `github.com/SinaMN75/Utilities-flutter`). There are **7 checked-out copies** of the
  submodule across your repos; the standalone clone at `U/Utilities-flutter` is the working source
  of truth for this effort.
- Global state/config lives in `abstract class U` (`init.dart`): `U.baseUrl`, `U.apiKey`, `U.user`,
  `U.contents`, `U.categories`, `U.tabs`, and **`U.s`** (the localization accessor).
- Sizes: package `lib` ≈ **73k LOC / ~200 Dart files** (+250 flag PNGs, 6 Persian fonts);
  `ava_hamrah_flutter` ≈ **6.0k LOC / 67 files**; `u_admin_flutter` ≈ **267 LOC / 4 files**.

**Key structural insight:** `u_admin_flutter` is a thin shell. Its entire UI is driven by the
package's `u_admin/` module (`runUAdminApp(UAdminConfig(...))`, `UAdminModules.*`). So "make u_admin
multi-language" is really "finish localizing the package's `u_admin/pages/*`", not work in the app
repo. `ava_hamrah_flutter`, by contrast, is a real hand-written app and is where most adoption +
i18n work lives.

---

## 2. The multi-language system (l10n)

**Setup:** Flutter Intl (Localizely) style. Source of truth = `lib/l10n/intl_en.arb` +
`intl_fa.arb`; generated code = `lib/generated/l10n.dart` (`class S`) +
`lib/generated/intl/messages_{en,fa,all}.dart`. Access via `S.of(context)` / `S.current`, surfaced
app-wide as **`U.s`**.

**Current state (healthy):**

- `intl_en.arb` and `intl_fa.arb` both have **637 keys, fully in sync**; generated
  `messages_en.dart` also has 637 — no drift.
- **Keys already follow your convention** (camelCase of the English statement):
  `"Create Reservation"` → `createReservation`, `"Try Again"` → `tryAgain`,
  `"No transactions found"` → `noTransactionsFound`. Requirement #4 is already the established
  pattern — new keys just need to follow it.
- Apps are wired: `ava_hamrah/main.dart` registers `S.delegate` + `supportedLocales: [en, fa]`;
  `u_admin` inherits it through `UMaterialApp`.

**Bug — the single most important i18n fix (`init.dart:9`):**

```dart

static S s = S.of(navigatorKey.currentState!.context);
```

This is a **static field initialized once** and then cached forever. `UApp.updateLocale()` (
`u_app_utils.dart:62`) calls `Get.updateLocale(locale)`, which reloads `S._current`, but **`U.s` is
never reassigned**. Result: after a runtime language switch, all **1045** `U.s.*` call sites in the
package keep returning the *previous* locale's strings until the app is restarted. Recommended fix:

```dart
static S get s => S.current; // always reflects the active locale
```

Low risk, high impact — worth doing first since the whole goal is multi-language.

**Coverage gaps:**

- `ava_hamrah_flutter`: **~289 hardcoded Persian string literals** across ~40 files (top offenders:
  `home_page.dart` 34, `vehicle_page.dart` 14, `bill_page.dart` 14,
  `driving_licence_detail_page.dart` 13, `profile_page.dart` 12, `vehicle_services_page.dart` 12).
  Only ~19 localized references exist today — the app is essentially **not** localized yet.
- Package `u_admin/pages/*`: mostly localized already (1045 `U.s.` uses) but **~18 hardcoded English
  literals** remain to sweep.
- Legitimate non-l10n Persian (do **not** touch): month/day names and data in `enums.dart`,
  `u_shamsi.dart`, `u_persian_tools.dart`, `date_extension.dart`, `u_country_city.dart`,
  `u_business_category.dart`. These are domain data, not UI copy.

**Many app strings already have keys.** The arb already defines `retry`, `tryAgain`, `error`,
`noData`, `cancel`, `confirm`, `submit`, `save`, `delete`, `search`, and a family of `noXFound`
keys — a lot of the 289 literals map to existing keys and need no new entries.

---

## 3. Bugs / cleanup in the package

| #  | Location                     | Issue                                                                                                                                                                                                                                                                                          | Suggested fix                                                                            |
|----|------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| B1 | `init.dart:9`                | `U.s` cached once; stale after locale switch (see §2)                                                                                                                                                                                                                                          | Convert to `static S get s => S.current;`                                                |
| B2 | `components/u_sidemenu.dart` | **Dead + colliding file.** Defines a second `class USideMenu` (87 lines) that duplicates the real one in `u_side_menu.dart` (1213 lines). It is **not exported** from the barrel and **used nowhere**. Two same-named public widgets is a latent import-collision trap.                        | Delete `u_sidemenu.dart` (or fold anything unique into `u_side_menu.dart`).              |
| B3 | package-wide                 | No `TODO/FIXME/UnimplementedError` markers found — good — but this also means unfinished behavior is silent. Needs a real `flutter analyze` pass on your machine to surface dead params, unused imports, missing `const`, etc. (the `analysis_options.yaml` promotes ~40 lints to **errors**). | Run `flutter analyze` in `U/Utilities-flutter`; fix reported issues in a dedicated pass. |
| B4 | `analysis_options.yaml`      | Excludes `lib/view/widgets/typeahead.dart`, a path that **doesn't exist** in the package (leftover from a copied config).                                                                                                                                                                      | Remove the stale exclude.                                                                |

I deliberately kept this list short and high-confidence rather than speculative. Once we can run the
analyzer (or once you point me at specific components you suspect), I'll expand it with verified
findings per component.

---

## 4. Adoption gaps — `ava_hamrah_flutter`

The app already adopts a lot: **135** `UText*` (vs 28 raw `Text`), **31** `UScaffold` (0 raw
`Scaffold`), **19** `UTextField`, **31** `UContainer`. The clear gaps:

| Raw widget                    | Count  | Package replacement       | Notes                                                                                         |
|-------------------------------|--------|---------------------------|-----------------------------------------------------------------------------------------------|
| `Column(`                     | **52** | `UColumn` (only 2 used)   | Biggest gap. `UColumn` adds `spacing`, `divider`, `flexFactors`, padding/radius/border sugar. |
| `Row(`                        | **43** | `URow` (only 1 used)      | Same story.                                                                                   |
| `Text(`                       | 28     | `UText*`                  | Finish the migration.                                                                         |
| `Container(`                  | 20     | `UContainer`              | Prefer `UContainer` for gradient/border/radius/shadow.                                        |
| `ElevatedButton`              | 2      | `UButton`                 |                                                                                               |
| `GestureDetector` / `InkWell` | 3 / 1  | `.onTap()` / `UPressable` | Widget-extension sugar.                                                                       |
| `SizedBox(height:`            | 76     | `UColumn(spacing:)`       | Many vertical `SizedBox` spacers collapse into `UColumn`'s `spacing`.                         |

None of these are urgent bugs — they're consistency/maintenance wins. I'd do them page-by-page
alongside the i18n extraction for that page, so each file is touched once.

---

## 5. Promotion candidates — app → package

Generic, non-app-specific widgets currently living in `ava_hamrah_flutter/lib/view/widgets/` that
belong in the package:

| App widget                  | File                     | Why promote                                                               | Package target                                                                         |
|-----------------------------|--------------------------|---------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| `GlassCard`                 | `common.dart`            | Pure glassmorphism (blur + tint + border), zero app logic                 | `components/container.dart` as `UGlassCard`                                            |
| `AppEmptyState`             | `common.dart`            | Generic empty-state; text should come from `U.s.noData`                   | `components/u_general_widgets.dart` as `UEmptyState`                                   |
| `AppErrorAndTryAgainButton` | `common.dart`            | Generic error+retry; strings → `U.s.error`/`U.s.tryAgain`                 | as `UErrorRetry`                                                                       |
| `SimpleHeaderCard`          | `common.dart`            | Icon + title + subtitle card, fully generic                               | as `UHeaderCard`                                                                       |
| `CompactIranPlateInput`     | `car_license_plate.dart` | Iran license-plate input — highly reusable, fits the Persian/Iran toolkit | new `components/u_plate_field.dart`                                                    |
| `AppUtils.showPdf`          | `utils/app_utils.dart`   | Base64→PDF bottom-sheet viewer                                            | `UNavigator.showPdf(...)` (needs `syncfusion_flutter_pdfviewer` added to package deps) |

**Keep app-local** (they encode app branding/domain): `WalletTxnTile`, `HeroWalletCard`,
`HomeGreetingHeader`, `BentoFeatureTile/TallTile/SmallTile`, `AppPackageCard`. The Bento tiles
*could* be generalized later, but they lean on app color tokens, so they're second-tier.

**Color caveat for promotion:** the promotion candidates reference `AppColors.*` (defined in
`ava_hamrah/main.dart`). Package versions must take colors as parameters defaulting to
`Theme.of(context).colorScheme`, per the package's hard rule (never `Colors.`/`AppColors.` inside
the package).

---

## 6. A note on the change-annotation rule (needs your call)

The `u-package` skill says "add one short single-line comment directly above **every** change." Your
global preference says "**only** add comments when the changed code is complex." These conflict.
I'll follow your **global preference** (comment only complex changes) unless you tell me otherwise —
flagging it so a diff full of comments (or the lack of them) isn't a surprise.

---

## 7. Proposed incremental plan (review-as-we-go)

Ordered for safety (package foundation first, then app-by-app):

1. **P0 — i18n foundation fix:** `U.s` getter (B1) + delete dead `u_sidemenu.dart` (B2) + drop stale
   analyzer exclude (B4). Tiny, unblocks reliable language switching. _One review._
2. **P1 — promote shared widgets** (§5) into the package with theme-based colors; update
   `ava_hamrah` to import them. _One review._
3. **P2 — `ava_hamrah` per-page passes:** for each page, in one edit: extract Persian strings → arb
   keys (reuse existing keys; new keys = camelCase of English, added to **both** `intl_en.arb` and
   `intl_fa.arb`), and swap raw `Column/Row/Text/Container` → `UColumn/URow/UText/UContainer`. Start
   with `home_page.dart` (highest string + widget density). _Review per page or per cluster._
4. **P3 — package `u_admin` English-literal sweep** (~18 strings) → `U.s` keys.
5. **P4 — analyzer pass** on package + apps once you can run `flutter analyze`; fix verified lints,
   then **regenerate `CAPABILITIES.md`** so the skill index reflects the new/moved components.

After each step you'll need to run `flutter gen-l10n`/the intl generator and `flutter pub get` in
the submodule, then commit & push the package and bump the submodule pointer in the apps (your side,
per our agreed workflow).

---

## 8. Open questions for you

1. **Locale switch fix (B1):** OK to change `U.s` to a getter? (Safe, but touches the accessor used
   1045×.)
2. **Delete `u_sidemenu.dart` (B2)?** Confirm nothing off-repo depends on it.
3. **Comment rule (§6):** global preference (comment only complex) vs skill rule (comment every
   change) — which wins?
4. **Where do we start the actual edits** — P0 first (recommended), or jump straight to
   `home_page.dart` so you see the full pattern (i18n + component adoption) on one real page?
