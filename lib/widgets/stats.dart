import 'package:flutter/material.dart';
import 'package:track_it/util/constants.dart';

class IncomeExpenseStats extends StatelessWidget {
  const IncomeExpenseStats({Key? key}) : super(key: key);

  final int budget = 5000;
  final int income = 10000;
  final int expenses = 3000;
  final int profit = 7000;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width * 0.85,
          child: const Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
        ),
        verticalSpacing(8.0),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    'Income',
                    style: subHeaderStyle,
                  ),
                  verticalSpacing(5.0),
                  Text(
                    'Ksh. $income',
                    style: regularTextStyle,
                  ),
                ],
              ),
              const VerticalDivider(
                thickness: 1.5,
                color: Colors.black,
              ),
              Column(
                children: [
                  const Text(
                    'Expenses',
                    style: subHeaderStyle,
                  ),
                  verticalSpacing(5.0),
                  Text(
                    'Ksh. $expenses',
                    style: regularTextStyle,
                  ),
                ],
              ),
              const VerticalDivider(
                thickness: 1.5,
                color: Colors.black,
              ),
              Column(
                children: [
                  const Text(
                    'Profit',
                    style: subHeaderStyle,
                  ),
                  verticalSpacing(5.0),
                  Text(
                    'Ksh. $profit',
                    style: regularTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpacing(8.0),
        SizedBox(
          width: width * 0.85,
          child: const Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
