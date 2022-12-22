import 'package:dart_lesson/domain/services/auth_service.dart';
import 'package:flutter/material.dart';

class StartViewModel {
  final _authService = AuthService();   //подключаемся к сервису авторизации
  BuildContext context;

  StartViewModel(this.context) {
    init();                       //при загрузке страницы запускаем эту функцию
  }

  void init() async {
    final isAuth = await _authService.checkAuth();  //проверяем авторизованность
    if (isAuth) {
      _goToAppScreen();   //если да - то на глваный экран
    } else {
      _goToAuthScreen();  //иначе - на страницу для входа
    }
  }

  //на страницу входа
  void _goToAuthScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil('auth', (route) => false);
  }

  //на главный экран
  void _goToAppScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
  }
}