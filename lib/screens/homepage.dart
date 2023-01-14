import 'dart:async';

import 'package:flutter/material.dart';
import 'package:track_it/screens/settings.dart';
import 'package:track_it/util/constants.dart';
import 'package:track_it/widgets/balance_card.dart';
import 'package:track_it/widgets/loading_circle.dart';
import 'package:track_it/widgets/stats.dart';
import 'package:track_it/widgets/my_transaction_card.dart';
import 'package:track_it/widgets/add_transaction_button.dart';
import 'package:track_it/google_sheets_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // collect user input
  final _textcontrollerAMOUNT = TextEditingController();
  final _textcontrollerITEM = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isIncome = false;

  double balance = 5000;

  // enter the new transaction into the spreadsheet
  void _enterTransaction() {
    GoogleSheetsApi.insert(
      _textcontrollerITEM.text,
      _textcontrollerAMOUNT.text,
      _isIncome,
    );
    setState(() {});
  }

  //add transactions with dialog
  void _addNewTransaction() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: const Text('N E W  T R A N S A C T I O N'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Expense'),
                          Switch(
                            value: _isIncome,
                            onChanged: (newValue) {
                              setState(() {
                                _isIncome = newValue;
                              });
                            },
                          ),
                          const Text('Income'),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Amount?',
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter an amount';
                                  }
                                  return null;
                                },
                                controller: _textcontrollerAMOUNT,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'For what?',
                              ),
                              controller: _textcontrollerITEM,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.grey[600],
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    color: Colors.grey[600],
                    child: const Text('Enter',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _enterTransaction();
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              );
            },
          );
        });
  }

  // show loading as data is being fetched form google
  bool timerHasStarted = false;
  void startLoading() {
    timerHasStarted = true;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (GoogleSheetsApi.loading == false) {
        // if loading is complete set state and cancel timer
        setState(() {});
        timer.cancel;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // start loading until data arrives
    if (GoogleSheetsApi.loading == true && timerHasStarted == false) {
      startLoading();
    }
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Settings()),
                            );
                          },
                          icon: const Icon(
                            Icons.settings_sharp,
                            size: 34.0,
                          ))
                    ],
                  ),
                ),
              ),
              BalanceCard(
                  balance: (balance - GoogleSheetsApi.calculateExpense())
                      .toString()),
              verticalSpacing(8.0),
              IncomeExpenseStats(
                  income: GoogleSheetsApi.calculateIncome().toString(),
                  expenses: GoogleSheetsApi.calculateExpense().toString(),
                  profit: (GoogleSheetsApi.calculateIncome() -
                          GoogleSheetsApi.calculateExpense())
                      .toString()),
              verticalSpacing(8.0),
              Expanded(
                child: Center(
                    child: Column(
                  children: [
                    Expanded(
                      child: GoogleSheetsApi.loading == true
                          ? const LoadingCircle()
                          : ListView.builder(
                              itemCount:
                                  GoogleSheetsApi.currentTransactions.length,
                              itemBuilder: (context, index) {
                                return MyTransactionCard(
                                    name: GoogleSheetsApi
                                        .currentTransactions[index][0],
                                    amount: GoogleSheetsApi
                                        .currentTransactions[index][1],
                                    isIncomeOrExpense: GoogleSheetsApi
                                        .currentTransactions[index][2]);
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
        floatingActionButton: AddTransactionButton(
          function: _addNewTransaction,
        ),
      ),
    );
  }
}
