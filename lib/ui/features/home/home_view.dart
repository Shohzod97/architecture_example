import 'package:dart_lesson/ui/features/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dart_lesson/ui/features/home/widgets/age_descriment.dart';
import 'package:dart_lesson/ui/features/home/widgets/age_increment.dart';
import 'package:dart_lesson/ui/features/home/widgets/age_title.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(        //оборачиваем провайдером, чтобы затем обновлять нужные переменные
      create: (_) => HomeViewModel(),     //сможем обращаться к этому через context: context.read<HomeViewModel>()
      child: const HomeView(),            //сам виджет страницы
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          LogOutButton(),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              AgeTitle(),
              AgeIncrementWidget(),
              AgeDecrementWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();      //подключаемся к модели
    return ElevatedButton(
      onPressed: () => viewModel.onLogoutPressed(context),
      child: const Text('Выход'),
    );
  }
}





