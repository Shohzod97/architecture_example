import 'package:dart_lesson/ui/features/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgeDecrementWidget extends StatelessWidget {
  const AgeDecrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return ElevatedButton(
      onPressed: viewModel.onDecrementButtonPressed,
      child: const Text('-'),
    );
  }
}