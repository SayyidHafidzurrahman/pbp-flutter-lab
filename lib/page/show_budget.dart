import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/models/budget_model.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dataBudget.budgets[index].title,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                      DateFormat('EEEE, MMMM d, yyyy')
                          .format(dataBudget.budgets[index].date),
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.left),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dataBudget.budgets[index].nominalBudget.toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        dataBudget.budgets[index].jenis,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: dataBudget.budgets.length,
      ),
    );
  }
}
