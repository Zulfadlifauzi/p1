import 'package:flutter/material.dart';
import 'package:project1/services/apiservice.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: APIservice().getCart('1'),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text('successfully');
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
