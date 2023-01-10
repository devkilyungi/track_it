import 'package:flutter/material.dart';
import 'package:track_it/util/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int budget = 5000;
  int income = 10000;
  int expenses = 3000;
  int profit = 7000;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: leftRight,
              child: Column(
                children: [
                  Padding(
                    padding: topBottom,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Welcome back, Victor!',
                          style: greeting,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings_sharp,
                            size: 32.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: cardHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Remaining Budget:',
                          style: header,
                        ),
                        verticalSpacing(8.0),
                        Text(
                          'Ksh. $budget',
                          style: remainingAmount,
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
                  verticalSpacing(8.0),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Income',
                              style: subHeader,
                            ),
                            verticalSpacing(5.0),
                            Text(
                              'Ksh. $income',
                              style: regularText,
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
                              style: subHeader,
                            ),
                            verticalSpacing(5.0),
                            Text(
                              'Ksh. $expenses',
                              style: regularText,
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
                              style: subHeader,
                            ),
                            verticalSpacing(5.0),
                            Text(
                              'Ksh. $profit',
                              style: regularText,
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
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
