import 'package:dart_lesson/domain/data_providers/auth_api_provider.dart';
import 'package:dart_lesson/domain/data_providers/session_data_provider.dart';

class AuthService {
  final _sessionDataProvider = SessionDataProvider();   //хранилище для локальной сессии
  final _authApiProvider = AuthApiProvider();           //хранилище инетернет-данных

  Future<bool> checkAuth() async {   //проверяет авторизованность
    final apiKey = await _sessionDataProvider.loadLocalApiKey(); //наличием API ключа
    return apiKey != null;
  }

  Future<void> login(String login, String password) async {
    final apiKey = await _authApiProvider.login(login, password);  //получаем апи черех вход
    await _sessionDataProvider.saveApiKey(apiKey);                 //сохраняем в локальной сессии
  }

  Future<void> logout() async {
    await _sessionDataProvider.clearApiKey();   //стираем апи ключ при выходе
  }
}
