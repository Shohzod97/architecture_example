import 'package:dart_lesson/domain/entity/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


//Класс-хранилище
class UserDataProvider {
  final sharedPreferences = SharedPreferences.getInstance();  //инициализируем хранилище

  //Подгрузка значений и вернет User-а
  Future<User> loadValue() async {
    final age = (await sharedPreferences).getInt('age') ?? 0;
    return User(age);
  }

  //сохранит новое значение
  Future<void> saveValue(User user) async {
    (await sharedPreferences).setInt('age', user.age);
  }
}
