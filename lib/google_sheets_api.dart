import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  // credentials
  static const _credentials = {'YOUR JSON CREDENTIALS'};

  // connecting to the spreadsheet
  static final _gsheets = GSheets(_credentials);
  static const _spreadsheetId = 'YOUR SPREADSHEEET ID';
  static Worksheet? _worksheet;

  // variables to keep track of things
  static int numberOfRows = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  // initializing the worksheet
  Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = spreadsheet.worksheetByTitle('Sheet1');
    countRows();
  }

  static Future countRows() async {
    // count rows in the sheet (4)
    while ((await _worksheet!.values.value(column: 1, row: numberOfRows + 1)) !=
        '') {
      numberOfRows++;
    }

    // load the transactions
    loadTransactions();
  }

  static Future loadTransactions() async {
    //if there are no transactions stop
    if (_worksheet == null) return;

    final String name;
    // else get the transactions details
    for (int currentRow = 2; currentRow <= numberOfRows; currentRow++) {
      final String name =
          await _worksheet!.values.value(column: 1, row: currentRow);
      final String amount =
          await _worksheet!.values.value(column: 2, row: currentRow);
      final String incomeOrExpense =
          await _worksheet!.values.value(column: 3, row: currentRow);

      if (currentTransactions.length < numberOfRows) {
        currentTransactions.add([
          name,
          amount,
          incomeOrExpense,
        ]);
      }
    }
    print(currentTransactions);
    // stop loading circle
    loading = false;
  }

  // insert a new transaction
  static Future insert(String name, String amount, bool _isIncome) async {
    if (_worksheet == null) return;
    numberOfRows++;
    currentTransactions.add([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
    await _worksheet!.values.appendRow([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
  }

  // CALCULATE THE TOTAL INCOME!
  static double calculateIncome() {
    double totalIncome = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'income') {
        totalIncome += double.parse(currentTransactions[i][1]);
      }
    }
    return totalIncome;
  }

  // CALCULATE THE TOTAL EXPENSE!
  static double calculateExpense() {
    double totalExpense = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'expense') {
        totalExpense += double.parse(currentTransactions[i][1]);
      }
    }
    return totalExpense;
  }
}
