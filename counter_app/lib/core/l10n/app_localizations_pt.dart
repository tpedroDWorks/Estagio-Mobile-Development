// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get counterAppTitle => 'Aplicação de Contador';

  @override
  String welcomeMessage(String name) {
    return 'Olá $name';
  }

  @override
  String get settings => 'Definições';

  @override
  String get usernameLabel => 'Nome de utilizador';

  @override
  String get saveButton => 'Guardar';

  @override
  String get clearDataButton => 'Limpar dados';

  @override
  String get resetCounterTitle => 'Reiniciar contador';

  @override
  String get resetCounterMessage =>
      'Tem a certeza que deseja reiniciar o contador?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get targetReached => 'Alvo atingido!';

  @override
  String get pushedButtonMessage => 'Carregou no botão este número de vezes:';

  @override
  String get lastOperations => 'Últimas 5 operações:';

  @override
  String get noOperations => 'Sem operações registadas.';

  @override
  String get operationIncrease => 'aumentar';

  @override
  String get operationDecrease => 'diminuir';

  @override
  String get operationReset => 'reiniciar';
}
