// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get counterAppTitle => 'Aplicación de Contador';

  @override
  String welcomeMessage(String name) {
    return 'Hola $name';
  }

  @override
  String get settings => 'Ajustes';

  @override
  String get usernameLabel => 'Nombre de usuario';

  @override
  String get saveButton => 'Guardar';

  @override
  String get clearDataButton => 'Limpiar datos';

  @override
  String get resetCounterTitle => 'Restablecer contador';

  @override
  String get resetCounterMessage =>
      '¿Estás seguro de que quieres restablecer el contador?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get targetReached => '¡Objetivo alcanzado!';

  @override
  String get pushedButtonMessage => 'Has pulsado el botón tantas veces:';

  @override
  String get lastOperations => 'Últimas 5 operaciones:';

  @override
  String get noOperations => 'No hay operaciones registradas.';

  @override
  String get operationIncrease => 'aumentar';

  @override
  String get operationDecrease => 'disminuir';

  @override
  String get operationReset => 'restablecer';
}
