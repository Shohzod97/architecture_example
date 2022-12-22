import 'package:dart_lesson/ui/features/auth/auth_view.dart';
import 'package:dart_lesson/ui/features/home/home_view.dart';
import 'package:dart_lesson/ui/features/start/start_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // routes: {
      //   'auth' : (context) => AuthWidget.create(),
      //   'example' : (context) => HomeView.create(),
      //   'loader' : (context) => LoaderWidget.create(),
      // },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'auth') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
                AuthView.create(),
            transitionDuration: Duration.zero,      //переход без анимации
          );
        } else if (settings.name == 'home') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
                HomeView.create(),
            transitionDuration: Duration.zero,
          );
        } else if (settings.name == 'start') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
                StartModel.create(),
            transitionDuration: Duration.zero,
          );
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartModel.create(),
      // home: HomeView.create(),
    );
  }
}
