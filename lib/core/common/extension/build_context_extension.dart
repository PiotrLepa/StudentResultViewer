import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/core/common/raw_key_string.dart';
import 'package:student_result_viewer/core/presentation/localization/app_localizations.dart';

extension TranslationsExtension on BuildContext {
  String translateKey(String key) =>
      AppLocalizations.of(this).translateKey(key);

  String translate(RawKeyString rawKeyString) =>
      AppLocalizations.of(this).translate(rawKeyString);
}
