import 'package:dart_lesson/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:dart_lesson/domain/data_providers/auth_api_provider.dart';
import 'package:dart_lesson/domain/services/auth_service.dart';

enum AuthButtonState { canSubmit, authProcess, disable }


//Тут все данные для обновленяи и отображения
class AuthViewModelState {
  String authErrorTitle = '';
  String login = '';
  String password = '';
  bool isAuthInProcess = false;

  //геттер может быть с условием
  AuthButtonState get authButtonState {   //на основе текущих значений расчитывает состояние доступности кнопки
    if (isAuthInProcess) {                //при каждом изменений значений этого объекта (например, если присвоили state.login = 'admin')
      return AuthButtonState.authProcess;
    } else if (login.isNotEmpty && password.isNotEmpty) {
      return AuthButtonState.canSubmit;
    } else {
      return AuthButtonState.disable;
    }
  }

  AuthViewModelState();
}


class AuthViewModel extends ChangeNotifier {
  final _authService = AuthService();       //сервис для авторизации

  final _state = AuthViewModelState();
  AuthViewModelState get state => _state;

  void changeLogin(String value) {
    if (_state.login == value) return;    //надо всегда стремиться к проверкам, чтобы не делать лишних ребилдов
    _state.login = value;
    notifyListeners();
  }

  void changePassword(String value) {
    if (_state.password == value) return;
    _state.password = value;
    notifyListeners();
  }

  Future<void> onAuthButtonPressed(BuildContext context) async {    //если нажата кнопка "Авторизоваться"
    final login = _state.login;
    final password = _state.password;

    if (login.isEmpty || password.isEmpty) return;

    _state.authErrorTitle = '';
    _state.isAuthInProcess = true;    //обвноляем состояние, что происходит авторизация
    notifyListeners();                //чтобы показать загружку

    try {
      await _authService.login(login, password);    //там внутри может выбросить ошибку
      _state.isAuthInProcess = false;               //поэтому если он пошел дальше, то значит ошибки не было
      notifyListeners();
      MainNavigation.showLoader(context);
    } on AuthApiProviderIncorectLoginDataError {    //нужно учесть разного рода ошибки
      _state.authErrorTitle = 'Неправильный логин или пароль';
      _state.isAuthInProcess = false;
      notifyListeners();
    } catch (exeption) {
      _state.authErrorTitle =
      'Случилось неприятность, попропуйте повторить позже';
      _state.isAuthInProcess = false;
      notifyListeners();
    }
  }
}