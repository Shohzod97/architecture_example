import 'dart:math';
import 'package:dart_lesson/domain/data_providers/user_data_provider.dart';
import 'package:dart_lesson/domain/entity/user.dart';


//Сервси для управления данными юзера
class UserService {
  final _userDataProvider = UserDataProvider();   //Сами значения храним в репоизтории
  var _user = User(0);                            //Создаем пользователя здесь
  User get user => _user;

  Future<void> initilalize() async {
    _user = await _userDataProvider.loadValue();  //Подгружаем его сохраненные значения с класса-хранилища
  }

  void incrementAge() {
    _user = user.copyWith(age: user.age + 1);     //изменяем
    _userDataProvider.saveValue(_user);           //сохраняем в классе-хралинище
  }

  void decrementAge() {
    _user = _user.copyWith(age: max(_user.age - 1, 0));
    _userDataProvider.saveValue(_user);
  }
}
