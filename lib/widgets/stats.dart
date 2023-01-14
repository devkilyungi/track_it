import 'package:flutter/material.dart';
import 'package:track_it/util/constants.dart';

class IncomeExpenseStats extends StatelessWidget {
  const IncomeExpenseStats({
    Key? key,
    required this.income,
    required this.expenses,
    required this.profit,
  }) : super(key: key);

  final String income;
  final String expenses;
  final String profit;

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
