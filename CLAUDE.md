# Working rules for the `u` package and projects that depend on it

This project uses the in-house **`u`** package (`import "package:u/utilities.dart";`) — a large
shared
library of extensions, UI components, utilities, and API services. **It almost certainly already
contains what you're about to write.**

## Golden rule: reuse before you write

Before writing ANY new Flutter code (a helper, a widget, a formatter, an API call, a validator, a
date conversion, storage, navigation, etc.):

1. **Search `CAPABILITIES.md`** (the package capability index) for the thing you need.
   `grep -ri "<keyword>" CAPABILITIES.md`
2. If the index points to something, open the named source file under `lib/` for the full signature
   and use it.
3. Only write new code if nothing in the package covers it — and if it's broadly reusable, prefer
   adding it to the `u` package rather than to a single project.

Never hand-roll a duplicate of something the package provides. Concretely:

- Text → use `UText*` (`UTextBodyMedium`, `UTextTitleLarge`, …), not raw `Text`.
- Buttons → `UButton` / `UButtonSubmitCancel` / `UPressable`.
- Inputs → `UTextField`, `UDropDownField`, `UTextFieldDatePicker`, `UOtpField`, etc.
- Layout → `UScaffold`, `UContainer`, `UColumn`, `URow`, `UCard`, `UListView`.
- API calls → `UServices.<area>.<method>(p: ..., onOk: ..., onError: ..., onException: ...)`, never
  raw `http`.
- Storage → `ULocalStorage` / `UFileStorage`, not raw `SharedPreferences`.
- Navigation & dialogs → `UNavigator` (`push`, `dialog`, `bottomSheet`, `confirm`,
  `inputDialog`, …).
- Loading / toasts → `ULoading`, `UToast`.
- Validation → `UValidators`.
- Dates → string/`DateTime` extensions and `Jalali`/`Gregorian` (`u_shamsi.dart`).
- Money/number formatting → `rial()`, `toman()`, `separateNumbers3By3()`, `toKMB()`, etc.
- Persian/Iranian logic → `PersianTools`, `UPhoneNumberUtils`.
- Widget layout sugar → chainable widget extensions (`.pAll()`, `.onTap()`, `.expanded()`,
  `.rtl()`, …).

A single `import "package:u/utilities.dart";` re-exports Flutter material, GetX, http, and all the
above — don't add redundant imports for things it already exports.

## Colors & theming (hard rule)

- **Never** use `Colors.` or `MaterialColors.`.
- Use `Theme.of(context).colorScheme.*` / `Theme.of(context).textTheme.*` first.
- If theme can't express it, use the project's `AppColors` (defined in the app's `main`/theme file).

## Code style (matches `analysis_options.yaml` — all enforced as errors)

- `prefer_double_quotes` → use `"double quotes"`.
- `always_specify_types` → annotate all types (no `var`/inferred for fields, params, public APIs);
  `omit_local_variable_types` is OFF here, so type local variables too (`final int x = ...`).
- `prefer_const_*` → use `const` wherever possible.
- `prefer_final_locals` / `prefer_final_fields` → use `final`.
- `prefer_expression_function_bodies` → use `=>` for one-expression bodies.
- `always_put_required_named_parameters_first`.
- `always_use_package_imports` → `package:` imports, not relative.
- `avoid_print` → never `print(...)`; use logging / `UCrashlytics` / `prettyLog`.
- `prefer_int_literals`, `unnecessary_const`, `avoid_redundant_argument_values`, etc.

## Change annotation (user preference)

Add a short, single-line comment directly above **every** change explaining what it does, so it's
easy to scan what was modified. Example:

```dart
// Reuse package money formatter instead of manual string building
final String price = amount.toman();
```

## When the package itself changes

If you add/remove components, services, extensions, or utilities in `lib/`, regenerate
`CAPABILITIES.md` so the index stays accurate.
