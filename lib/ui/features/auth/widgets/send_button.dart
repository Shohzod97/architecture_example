import 'package:dart_lesson/ui/features/auth/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AuthSendButtonWidget extends StatelessWidget {
  const AuthSendButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthViewModel>();
    final authButtonState = context.select((AuthViewModel value) => value.state.authButtonState);

    final canSubmit = authButtonState == AuthButtonState.canSubmit;

    final child = authButtonState == AuthButtonState.authProcess
        ? const CircularProgressIndicator()
        : const Text('Авторизоваться');
    return ElevatedButton(
      onPressed: canSubmit? () => model.onAuthButtonPressed(context) : null,
      child: child,
    );
  }
}
