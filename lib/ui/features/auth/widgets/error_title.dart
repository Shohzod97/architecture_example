import 'package:dart_lesson/ui/features/auth/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorTitleWidget extends StatelessWidget {
  const ErrorTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authErrorTitle =
    context.select((AuthViewModel value) => value.state.authErrorTitle);
    return Text(authErrorTitle);
  }
}
