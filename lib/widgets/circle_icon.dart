import 'package:flutter/material.dart';
import 'package:track_it/util/constants.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({Key? key, required this.isIncome}) : super(key: key);

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          (isIncome == true) ? '+' : '-',
          style: const TextStyle(color: Colors.white, fontSize: 32),
        ),
      ),
    );
  }
}
