import 'package:flutter/material.dart';
import 'package:track_it/util/constants.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key, required this.balance}) : super(key: key);

  final String balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Remaining Budget:',
            style: headerStyle,
          ),
          verticalSpacing(8.0),
          Text(
            'Ksh. $balance',
            style: remainingAmountStyle,
          ),
        ],
      ),
    );
  }
}
