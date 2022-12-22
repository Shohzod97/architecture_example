import 'package:shared_preferences/shared_preferences.dart';

abstract class SessionDataProviderKeys {
  static const _apiKey = 'api_key';
}

class SessionDataProvider {
  final _sharedPreferences = SharedPreferences.getInstance();

  Future<String?> loadLocalApiKey() async {   //загрузка локалього апи ключа (либо есть либо null)
    return (await _sharedPreferences).getString(SessionDataProviderKeys._apiKey);
  }

  Future<void> saveApiKey(String key) async { //сохранение апи ключа в локал. хран.
    (await _sharedPreferences).setString(SessionDataProviderKeys._apiKey, key);
  }

  Future<void> clearApiKey() async {    //удал. апи ключа из хранилища
    (await _sharedPreferences).remove(SessionDataProviderKeys._apiKey);
  }
}
