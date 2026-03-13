import 'package:counter_app/core/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension LocalizationsContext on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
