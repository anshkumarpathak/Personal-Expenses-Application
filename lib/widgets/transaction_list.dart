import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
//  TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 550,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 300,
                      child: Image.asset(
                        'Assets/Images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('\$${transactions[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: ()=>deleteTx(transactions[index].id),
                      ),
                    ),
                  );
                  // Card(
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //               color: Theme.of(context).primaryColor, width: 2),
                  //         ),
                  //         child: Text(
                  //           '\$${transactions[index].amount.toStringAsFixed(2)}', // for displaying only 2 digits after decimal
                  //           style: TextStyle(
                  //             color: Theme.of(context).primaryColor,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 20,
                  //           ),
                  //         ),
                  //         padding: EdgeInsets.all(10),
                  //       ),
                  //       Column(
                  //         children: [
                  //           Text(
                  //             transactions[index].title,
                  //             //style: Theme.of(context).textTheme.titleMedium,
                  //             style: TextStyle(
                  //                 color: Theme.of(context).primaryColor,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 18),
                  //           ),
                  //           Text(
                  //             DateFormat.yMMMd().format(transactions[index].date),
                  //             style: TextStyle(fontSize: 16, color: Colors.grey),
                  //           ),
                  //         ],
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //       )
                  //     ],
                  //   ),
                  // );
                },
                itemCount: transactions.length,
              ),
      ),
    );
  }
}
