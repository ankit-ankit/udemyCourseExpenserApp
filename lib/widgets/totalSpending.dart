import 'package:flutter/material.dart';
import '../modals/transactions.dart';
import 'package:intl/intl.dart';
class TotalSpending extends StatelessWidget {
  final List<Transaction> recentTransactions;
  TotalSpending(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum = totalSum + recentTransactions[i].amount;
        }
      }
     
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return  sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            'Total Spending of the week = Rs${totalSpending.toStringAsFixed(0)}',
            style: TextStyle(fontSize: 18, color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}
