import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {

  final int value =0;

  static const name = 'Counter_Screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('counter screen'),
      ),

      body:Center(
        child: Text('Valor: $value',style: Theme.of(context).textTheme.titleLarge,)
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => (),
          ),
    );
  }
}