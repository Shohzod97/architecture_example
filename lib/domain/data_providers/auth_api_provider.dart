abstract class AuthApiProviderError {}

class AuthApiProviderIncorectLoginDataError {}  //ошибка неправильных логина и пароля

//Получение апи ключа с сервера
class AuthApiProvider {
  Future<String> login(String login, String password) async {
    await Future<void>.delayed(const Duration(seconds: 1));  //для имитации загрузки в этом примере
    final isSuccess = login == 'admin' && password == '123456';

    if (isSuccess) {
      return 'sdkjfjsdhgfjhgasdf3q23765467tew6q746d';   //вернет апи ключ, если всё верно
    } else {
      throw AuthApiProviderIncorectLoginDataError();    //а иначе выкинет ошибку
    }

  }
}
