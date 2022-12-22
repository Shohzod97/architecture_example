import 'package:dart_lesson/domain/services/auth_service.dart';
import 'package:dart_lesson/domain/services/user_service.dart';
import 'package:dart_lesson/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

//state - содержит данные для отображения на экране в готовом виде
class HomeState {
  final String ageTitle;          //age - это цифра, но на экране это строка
  HomeState({                     //поэтому во ViewModel мы делаем интерполяцию и сохраняем
    required this.ageTitle,
  });
}


class HomeViewModel extends ChangeNotifier {
  final _authService = AuthService();   //Подключаемся к сервису авторизации
  final _userService = UserService();   //Подключаемся к сервису юзера

  //При создании HomeViewModel (то есть при загрузке экрана)
  HomeViewModel() {
    loadValue();       //загружаем нужные данные
  }

  void loadValue() async {
    await _userService.initilalize();   //загружаем последние сохраненные данные
    _updateState();                     //после чего обновляем данные state
  }

  Future<void> onIncrementButtonPressed() async {
    _userService.incrementAge();        //все изменения делаем через сервисы, а через. фун. только обращаемся к ним
    _updateState();
  }

  Future<void> onDecrementButtonPressed() async {
    _userService.decrementAge();
    _updateState();
  }

  Future<void> onLogoutPressed(BuildContext context) async {
    await _authService.logout();
    MainNavigation.showLoader(context);
  }

  //Мы всего лишь 1 класс HomeViewModel создаем
  //Поэтому всё подключаемое в едиснтвенном экземпляре
  var _state = HomeState(ageTitle: '');     //как и этот state, который мы меням
  HomeState get state => _state;

  void _updateState() {
    final user = _userService.user;

    _state = HomeState(
      ageTitle: user.age.toString(),
    );
    notifyListeners();
  }
}
