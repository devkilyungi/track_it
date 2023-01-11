import 'package:flutter/material.dart';
import 'package:track_it/util/constants.dart';

class AddTransactionButton extends StatelessWidget {
  final function;

  const AddTransactionButton({super.key, this.function});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: function,
      child: const Icon(
        Icons.add,
        size: 32,
      ),
    );
  }
}
