import 'package:flutter/material.dart';
import 'package:ininoutout_flutter/core/constants/icons.dart';
import 'package:ininoutout_flutter/core/models/earning/earning.dart';
import 'package:ininoutout_flutter/core/models/earning/earning_category.dart';
import 'package:ininoutout_flutter/core/models/expense/expanse.dart';
import 'package:ininoutout_flutter/core/models/expense/expense_category.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider with ChangeNotifier {
  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
    notifyListeners();
  }

  // in-app memory for holding the Expense categories temporarily
  List<EarningCategory> _earningCategories = [];
  List<EarningCategory> get earningCategories => _earningCategories;
  List<ExpenseCategory> _expenseCategories = [];
  List<ExpenseCategory> get expenseCategories => _expenseCategories;

  List<Earning> _earnings = [];
  List<Earning> get earnings {
    return _searchText != ''
        ? _earnings
            .where((element) =>
                element.title.toLowerCase().contains(_searchText.toLowerCase()))
            .toList()
        : _earnings;
  }

  List<Expense> _expenses = [];
  List<Expense> get expenses {
    return _searchText != ''
        ? _expenses
            .where((element) =>
                element.title.toLowerCase().contains(_searchText.toLowerCase()))
            .toList()
        : _expenses;
  }

  // Create database and data table
  Database? _database;
  Future<Database> get database async {
    final databaseDirectory = await getDatabasesPath(); // database directory
    const databaseName = 'ininoutout.db'; // database name
    final path = join(databaseDirectory, databaseName); // full path

    _database = await openDatabase(path, version: 1, onCreate: _createDb);

    return _database!;
  }

  // _createDb function
  static const earningTable = 'Earning';
  static const expenseTable = 'Expense';
  static const earningCategoryTable = 'EarningCategory';
  static const expenseCategoryTable = 'ExpenseCategory';
  Future<void> _createDb(Database db, int varsion) async {
    // this method runs only once. when the database is being created
    // so create the tables here and if you want to insert some initial values
    // insert it in this function.

    await db.transaction((txn) async {
      // Earning Category Table
      await txn.execute('''CREATE TABLE $earningCategoryTable(
        title TEXT,
        entries INTEGER,
        totalAmount TEXT)''');
      // Expense Category Table
      await txn.execute('''CREATE TABLE $expenseCategoryTable(
        title TEXT,
        entries INTEGER,
        totalAmount TEXT)''');
      // Earning Table
      await txn.execute('''CREATE TABLE $earningTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        amount TEXT,
        date TEXT,
        category TEXT)''');
      // Expense Table
      await txn.execute('''CREATE TABLE $expenseTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        amount TEXT,
        date TEXT,
        category TEXT)''');

      // Initial Earning Category Table
      for (int i = 0; i < icons.length; i++) {
        await txn.insert(earningCategoryTable, {
          'title': icons.keys.toList()[i],
          'entries': 0,
          'totalAmount': (0.0).toString(),
        });
      }

      // Initial Earning Category Table
      for (int i = 0; i < icons.length; i++) {
        await txn.insert(expenseCategoryTable, {
          'title': icons.keys.toList()[i],
          'entries': 0,
          'totalAmount': (0.0).toString(),
        });
      }
    });
  }

  // Find Earning category
  EarningCategory findEarningCategory(String title) {
    return _earningCategories.firstWhere((element) => element.title == title);
  }

  // Find Expense category
  ExpenseCategory findExpenseCategory(String title) {
    return _expenseCategories.firstWhere((element) => element.title == title);
  }

  // =========================================================================================== FETCH
  // method to fetch earning categories
  Future<List<EarningCategory>> fetchEarningCategories() async {
    // get the database
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(earningCategoryTable).then((data) {
        // 'data' is our fetched value
        // convert it from "Map<String, object>" to "Map<String, dynamic>"
        final converted = List<Map<String, dynamic>>.from(data);
        // create a 'EarningCategory'from every 'map' in this 'converted'
        List<EarningCategory> nList = List.generate(converted.length,
            (index) => EarningCategory.fromString(converted[index]));
        // set the value of 'earningCategories' to 'nList'
        _earningCategories = nList;
        // return the '_earningCategories'
        return _earningCategories;
      });
    });
  }

  // method to fetch expense categories
  Future<List<ExpenseCategory>> fetchExpenseCategories() async {
    // get the database
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(expenseCategoryTable).then((data) {
        // 'data' is our fetched value
        // convert it from "Map<String, object>" to "Map<String, dynamic>"
        final converted = List<Map<String, dynamic>>.from(data);
        // create a 'ExpenseCategory'from every 'map' in this 'converted'
        List<ExpenseCategory> nList = List.generate(converted.length,
            (index) => ExpenseCategory.fromString(converted[index]));
        // set the value of 'expenseCategories' to 'nList'
        _expenseCategories = nList;
        // return the '_expenseCategories'
        return _expenseCategories;
      });
    });
  }

  // Fetch Earning by category
  Future<List<Earning>> fetchEarning(String category) async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(earningTable,
          where: 'category == ?', whereArgs: [category]).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);

        List<Earning> nList = List.generate(
            converted.length, (index) => Earning.fromString(converted[index]));
        _earnings = nList;
        return _earnings;
      });
    });
  }

  // Fetch Expenses by Category
  Future<List<Expense>> fetchExpenses(String category) async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(expenseTable,
          where: 'category == ?', whereArgs: [category]).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);

        List<Expense> nList = List.generate(
            converted.length, (index) => Expense.fromString(converted[index]));
        _expenses = nList;
        return _expenses;
      });
    });
  }

  // Fetch All Earning
  Future<List<Earning>> fetchAllEarning() async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(earningTable).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        List<Earning> nList = List.generate(
            converted.length, (index) => Earning.fromString(converted[index]));
        _earnings = nList;
        return _earnings;
      });
    });
  }

  // Fetch All Expense
  Future<List<Expense>> fetchAllExpense() async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(expenseTable).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        List<Expense> nList = List.generate(
            converted.length, (index) => Expense.fromString(converted[index]));
        _expenses = nList;
        return _expenses;
      });
    });
  }
  // =========================================================================================== END FETCH

  // =========================================================================================== ADD
  // Earning add
  Future<void> addEarning(Earning ern) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .insert(
        earningTable,
        ern.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
          .then((generatedId) {
        final file = Earning(
            id: generatedId,
            title: ern.title,
            amount: ern.amount,
            date: ern.date,
            category: ern.category);

        _earnings.add(file);
        notifyListeners();
        var ex = findEarningCategory(ern.category);

        updateEarningCategory(
            ern.category, ex.entries + 1, ex.totalAmount + ern.amount);
      });
    });
  }

  // Expense add
  Future<void> addExpense(Expense exp) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .insert(
        expenseTable,
        exp.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
          .then((generatedId) {
        final file = Expense(
            id: generatedId,
            title: exp.title,
            amount: exp.amount,
            date: exp.date,
            category: exp.category);

        _expenses.add(file);
        notifyListeners();
        var ex = findExpenseCategory(exp.category);

        updateExpenseCategory(
            exp.category, ex.entries + 1, ex.totalAmount + exp.amount);
      });
    });
  }
  // =========================================================================================== END ADD

  // =========================================================================================== UPDATE
  // Earning Category update
  Future<void> updateEarningCategory(
      String category, int nEntries, double nTotalAmount) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .update(
        earningCategoryTable,
        {
          'entries': nEntries, // new value of 'entries'
          'totalAmount': nTotalAmount.toString(), // new value of 'totalAmount'
        },
        where: 'title == ?',
        whereArgs: [category],
      )
          .then((_) {
        // after updating in database. update it in our in-app memory too.
        var file = _earningCategories
            .firstWhere((element) => element.title == category);
        file.entries = nEntries;
        file.totalAmount = nTotalAmount;
        notifyListeners();
      });
    });
  }

  //  Expense Category update
  Future<void> updateExpenseCategory(
      String category, int nEntries, double nTotalAmount) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .update(
        expenseCategoryTable,
        {
          'entries': nEntries, // new value of 'entries'
          'totalAmount': nTotalAmount.toString(), // new value of 'totalAmount'
        },
        where: 'title == ?',
        whereArgs: [category],
      )
          .then((_) {
        var file = _expenseCategories
            .firstWhere((element) => element.title == category);
        file.entries = nEntries;
        file.totalAmount = nTotalAmount;
        notifyListeners();
      });
    });
  }

  // =========================================================================================== END UPDATE

  // =========================================================================================== DELETE
  // Earning delete
  Future<void> deleteEarning(int ernId, String category, double amount) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .delete(earningTable, where: 'id == ?', whereArgs: [ernId]).then((_) {
        // remove from in-app memory too
        _earnings.removeWhere((element) => element.id == ernId);
        notifyListeners();
        // we have to update the entries and totalAmount too

        var ex = findEarningCategory(category);
        updateEarningCategory(
            category, ex.entries - 1, ex.totalAmount - amount);
      });
    });
  }

  // Expense delete
  Future<void> deleteExpense(int expId, String category, double amount) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .delete(expenseTable, where: 'id == ?', whereArgs: [expId]).then((_) {
        // remove from in-app memory too
        _expenses.removeWhere((element) => element.id == expId);
        notifyListeners();
        // we have to update the entries and totalAmount too

        var ex = findExpenseCategory(category);
        updateExpenseCategory(
            category, ex.entries - 1, ex.totalAmount - amount);
      });
    });
  }
  // =========================================================================================== END DELETE

  // =========================================================================================== EARNING DATA
  // Calculate Entries and Amount Earning
  Map<String, dynamic> calculateEntriesAndAmountEarning(String category) {
    double total = 0.0;
    var list = _earnings.where((element) => element.category == category);
    for (var i in list) {
      total += i.amount;
    }

    return {'entries': list.length, 'totalAmount': total};
  }

  // Calculate total earning
  double calculateTotalEarning() {
    return _earningCategories.fold(
        0.0, (previousValue, element) => previousValue + element.totalAmount);
  }

  //  Calculate weekly earning
  List<Map<String, dynamic>> calculateWeekEarning() {
    List<Map<String, dynamic>> data = [];

    // we know that we need 7 entries
    for (var i = 0; i < 7; i++) {
      double total = 0.0; // 1 total for each entry
      final weekDay = DateTime.now().subtract(Duration(days: i));

      for (var j = 0; j < _earnings.length; j++) {
        if (_earnings[j].date.year == weekDay.year &&
            _earnings[j].date.month == weekDay.month &&
            _earnings[j].date.day == weekDay.day) {
          total += _earnings[j].amount;
        }
      }

      data.add({'day': weekDay, 'amount': total});
    }

    return data;
  }

  // =========================================================================================== END EARNING DATA

  // =========================================================================================== EARNING DATA
  // Calculate Entries and Amount Expense
  Map<String, dynamic> calculateEntriesAndAmountExpense(String category) {
    double total = 0.0;
    var list = _expenses.where((element) => element.category == category);
    for (var i in list) {
      total += i.amount;
    }

    return {'entries': list.length, 'totalAmount': total};
  }

  // Calculate total expense
  double calculateTotalExpense() {
    return _expenseCategories.fold(
        0.0, (previousValue, element) => previousValue + element.totalAmount);
  }

  // Calculate weekly expenses
  List<Map<String, dynamic>> calculateWeekExpenses() {
    List<Map<String, dynamic>> data = [];

    // we know that we need 7 entries
    for (var i = 0; i < 7; i++) {
      double total = 0.0; // 1 total for each entry
      final weekDay = DateTime.now().subtract(Duration(days: i));

      for (var j = 0; j < _expenses.length; j++) {
        if (_expenses[j].date.year == weekDay.year &&
            _expenses[j].date.month == weekDay.month &&
            _expenses[j].date.day == weekDay.day) {
          total += _expenses[j].amount;
        }
      }

      data.add({'day': weekDay, 'amount': total});
    }

    // return data list
    return data;
  }
  // =========================================================================================== END EARNING DATA

  // =========================================================================================== CHART DATA

  Map<String, dynamic> calculateEntriesAndAmountEarningAndExpanse() {
    double max = 0.0;
    var listEarning = _earnings;
    var listExpense = _expenses;

    for (var i in listEarning) {
      if (i.amount > max) {
        max = i.amount + ((i.amount * 20) / 100);
      }
    }
    for (var i in listExpense) {
      if (i.amount > max) {
        max = i.amount + ((i.amount * 20) / 100);
      }
    }

    return {'earningEntries': listEarning.length, 'expenseEntries': listEarning.length, 'maxY': max};
  }

  //  Calculate weekly earning and expense
  List<Map<String, dynamic>> calculateWeekEarningAndExpense() {
    List<Map<String, dynamic>> data = [];

    // we know that we need 7 entries
    for (var i = 0; i < 7; i++) {
      double totalEaring = 0.0; // 1 total for each entry
      double totalExpense = 0.0; // 1 total for each entry
      final weekDay = DateTime.now().subtract(Duration(days: i));

      // Earning total
      for (var j = 0; j < _earnings.length; j++) {
        if (_earnings[j].date.year == weekDay.year &&
            _earnings[j].date.month == weekDay.month &&
            _earnings[j].date.day == weekDay.day) {
          totalEaring += _earnings[j].amount;
        }
      }

      // Expense total
      for (var k = 0; k < _expenses.length; k++) {
        if (_expenses[k].date.year == weekDay.year &&
            _expenses[k].date.month == weekDay.month &&
            _expenses[k].date.day == weekDay.day) {
          totalExpense += _expenses[k].amount;
        }
      }

      data.add({
        'day': weekDay,
        'earningAmount': totalEaring,
        'expenseAmount': totalExpense
      });
    }

    return data;
  }

  // =========================================================================================== END CHART DATA
}
