import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modals/transactions.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.delTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function delTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  Color _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.orange,
      Colors.amber
    ];
    print('initState()');
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
              padding: EdgeInsets.all(6.0),
              child: FittedBox(child: Text('Rs${widget.transaction.amount}'))),
        ),
        title: Text(widget.transaction.title,
            style: Theme.of(context).textTheme.title),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text(
                  'delete',
                ),
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).errorColor,
                onPressed: () => widget.delTx(widget.transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.delTx(widget.transaction.id),
              ),
      ),
    );
  }
}
