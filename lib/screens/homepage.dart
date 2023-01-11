import 'package:flutter/material.dart';
import 'package:track_it/util/constants.dart';
import 'package:track_it/widgets/balance_card.dart';
import 'package:track_it/widgets/stats.dart';
import 'package:track_it/widgets/my_transaction_card.dart';
import 'package:track_it/widgets/add_transaction_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightCreamColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Welcome back, Victor!',
                        style: greetingStyle,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings_sharp,
                            size: 34.0,
                          ))
                    ],
                  ),
                ),
              ),
              const BalanceCard(),
              verticalSpacing(8.0),
              const IncomeExpenseStats(),
              verticalSpacing(8.0),
              Expanded(
                child: Center(
                    child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const MyTransactionCard(
                              name: 'FxTarget',
                              amount: '1170',
                              isIncomeOrExpense: 'expense');
                        },
                      ),
                    ),
                  ],
                )),
              ),
              verticalSpacing(8.0),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const AddTransactionButton(),
      ),
    );
  }
}
