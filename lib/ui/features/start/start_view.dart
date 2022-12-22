import 'package:dart_lesson/ui/features/start/start_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Страница для загрузки начальных данных
class StartModel extends StatelessWidget {
  const StartModel({Key? key}) : super(key: key);

  static Widget create() {
    return Provider(
      create: (context) => StartViewModel(context),
      child: const StartModel(),
      lazy: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

}
