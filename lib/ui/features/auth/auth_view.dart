import 'package:dart_lesson/ui/features/auth/auth_vm.dart';
import 'package:dart_lesson/ui/features/auth/widgets/error_title.dart';
import 'package:dart_lesson/ui/features/auth/widgets/login_field.dart';
import 'package:dart_lesson/ui/features/auth/widgets/password_field.dart';
import 'package:dart_lesson/ui/features/auth/widgets/send_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              ErrorTitleWidget(),
              SizedBox(height: 10),
              LoginField(),
              SizedBox(height: 10),
              PasswordField(),
              SizedBox(height: 10),
              AuthSendButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}