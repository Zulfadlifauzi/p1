import 'package:flutter/material.dart';
import 'package:project1/models/store_model.dart';
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
              List products = snapshot.data['products'];
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                      future: APIservice()
                          .getSingleProducts(products[index]['productId']),
                      builder: (context, AsyncSnapshot asyncSnapshot) {
                        if (asyncSnapshot.hasData) {
                          Product _product = asyncSnapshot.data;
                          return ListTile(
                            title: Text(_product.title.toString()),
                            leading: Image.network(
                              _product.image.toString(),
                              height: 40,
                            ),
                            subtitle: Text("Quantity - " +
                                products[index]['quantity'].toString()),
                            trailing: IconButton(
                              onPressed: () async {
                                await APIservice().deleteCart('1');
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Deleted Successfully ')));
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          );
                        }
                        return LinearProgressIndicator();
                      });
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.green,
        child: Center(
          child: Text(
            'Order Now',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
