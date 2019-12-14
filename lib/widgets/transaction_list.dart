import 'package:flutter/material.dart';
import './transaction_item.dart';

import '../modals/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;

  TransactionList(this.transactions, this.delTx);

  @override
  Widget build(BuildContext context) {
    print('TransactionList build() called');
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transactions added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png')),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id), transaction: tx, delTx: delTx))
                .toList());
  }
}
