import 'package:flutter/material.dart';
import 'package:track_it/util/constants.dart';
import 'package:track_it/widgets/circle_icon.dart';

class MyTransactionCard extends StatelessWidget {
  const MyTransactionCard({
    Key? key,
    required this.name,
    required this.amount,
    required this.isIncomeOrExpense,
  }) : super(key: key);

  final String name;
  final String amount;
  final String isIncomeOrExpense;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      height: 90,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Center(
        child: ListTile(
          leading: CircleIcon(
            isIncome: isIncomeOrExpense == 'income' ? true : false,
          ),
          title: Text(
            name,
            style: headerStyle,
          ),
          trailing: Text(
            isIncomeOrExpense == 'income'
                ? '+' ' Ksh. $amount'
                : '—' ' Ksh. $amount',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isIncomeOrExpense == 'income' ? Colors.green : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
