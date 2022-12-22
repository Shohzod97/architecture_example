import 'package:flutter/material.dart';
import 'package:dart_lesson/ui/features/auth/auth_vm.dart';
import 'package:provider/provider.dart';

class LoginField extends StatelessWidget {
  const LoginField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthViewModel>();
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Логин',
        border: OutlineInputBorder(),
      ),
      onChanged: model.changeLogin,
    );
  }
}