#!/usr/bin/env python3
"""Regenerate the intl generated files from the .arb source of truth.

The `u` package's l10n keys are all simple (non-parameterized) messages, and the
generated files under lib/generated/ are excluded from the analyzer. That lets us
treat lib/l10n/intl_<locale>.arb as the single source of truth and rebuild:

  - lib/generated/intl/messages_en.dart
  - lib/generated/intl/messages_fa.dart
  - lib/generated/l10n.dart   (only the getter block is rewritten; boilerplate kept)

Run from the package root:  python3 tool/gen_l10n.py

This is a stand-in for `flutter gen-l10n` / intl_utils when no Dart toolchain is
available. Output is valid Dart (not necessarily byte-identical to intl_utils).
"""
import json
import collections
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
L10N = os.path.join(ROOT, "lib", "l10n")
GEN = os.path.join(ROOT, "lib", "generated")
LOCALES = ["en", "fa"]


def load_arb(locale):
    p = os.path.join(L10N, f"intl_{locale}.arb")
    with open(p, encoding="utf-8") as f:
        return json.load(f, object_pairs_hook=collections.OrderedDict)


def dart_str(value):
    """Emit a Dart double-quoted string literal for an arbitrary value."""
    return json.dumps(value, ensure_ascii=False)


MESSAGES_HEADER = """// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a {locale} locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {{
  String get localeName => '{locale}';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{{
"""

MESSAGES_FOOTER = """  };
}
"""


def write_messages(locale, data):
    lines = [MESSAGES_HEADER.format(locale=locale)]
    for key, value in data.items():
        lines.append(
            f'    "{key}": MessageLookupByLibrary.simpleMessage({dart_str(value)}),\n'
        )
    lines.append(MESSAGES_FOOTER)
    out = os.path.join(GEN, "intl", f"messages_{locale}.dart")
    with open(out, "w", encoding="utf-8") as f:
        f.write("".join(lines))
    print(f"wrote {out} ({len(data)} keys)")


def write_l10n(keys_en):
    """Rewrite only the getter block of l10n.dart, preserving all boilerplate."""
    path = os.path.join(GEN, "l10n.dart")
    with open(path, encoding="utf-8") as f:
        src = f.read()

    # Head: everything up to and including the maybeOf(...) method.
    marker = "  static S? maybeOf(BuildContext context) {\n    return Localizations.of<S>(context, S);\n  }\n"
    idx = src.index(marker) + len(marker)
    head = src[:idx]

    # Tail: from the delegate class to EOF.
    tail_idx = src.index("class AppLocalizationDelegate")
    tail = src[tail_idx:]

    getters = []
    for key, value in keys_en.items():
        getters.append(f"\n  String get {key} {{\n")
        getters.append(
            f"    return Intl.message({dart_str(value)}, name: '{key}', desc: '', args: []);\n"
        )
        getters.append("  }\n")
    getters.append("}\n\n")

    with open(path, "w", encoding="utf-8") as f:
        f.write(head + "".join(getters) + tail)
    print(f"wrote {path} ({len(keys_en)} getters)")


def main():
    per_locale = {loc: load_arb(loc) for loc in LOCALES}
    en = per_locale["en"]
    # Sanity: all locales must share the same key set.
    for loc, data in per_locale.items():
        missing = set(en) - set(data)
        extra = set(data) - set(en)
        if missing or extra:
            raise SystemExit(f"[{loc}] key mismatch. missing={missing} extra={extra}")
    for loc, data in per_locale.items():
        write_messages(loc, data)
    write_l10n(en)
    print("done.")


if __name__ == "__main__":
    main()
