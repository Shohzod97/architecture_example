//entity - это формы для данных
//например, User - карточка данных о юзере

class User {
  final int age;

  User(this.age);

  User copyWith({
    int? age,
  }) {
    return User(
      age ?? this.age,
    );
  }
}