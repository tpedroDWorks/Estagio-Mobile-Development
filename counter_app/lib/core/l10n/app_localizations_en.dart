// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get counterAppTitle => 'Counter App';

  @override
  String welcomeMessage(String name) {
    return 'Hey $name';
  }

  @override
  String get settings => 'Settings';

  @override
  String get usernameLabel => 'Username';

  @override
  String get saveButton => 'Save';

  @override
  String get clearDataButton => 'Clear data';

  @override
  String get resetCounterTitle => 'Reset counter';

  @override
  String get resetCounterMessage =>
      'Are you sure you want to reset the counter?';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get targetReached => 'Target reached!';

  @override
  String get pushedButtonMessage =>
      'You have pushed the button this many times:';

  @override
  String get lastOperations => 'Last 5 operations:';

  @override
  String get noOperations => 'No operations recorded.';

  @override
  String get operationIncrease => 'increase';

  @override
  String get operationDecrease => 'decrease';

  @override
  String get operationReset => 'reset';
}
