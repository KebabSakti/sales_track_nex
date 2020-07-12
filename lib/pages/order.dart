import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text('Order'),
      ),
      body: Center(
        child: Text('This is order page'),
      ),
    );
  }
}
