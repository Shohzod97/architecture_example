import 'package:dart_lesson/ui/features/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgeTitle extends StatelessWidget {
  const AgeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.select((HomeViewModel vm) => vm.state.ageTitle);
    return Text(title);
  }
}