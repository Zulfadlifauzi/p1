import 'package:flutter/material.dart';
import 'package:project1/models/store_model.dart';
import 'package:project1/services/apiservice.dart';

class ProductDetailScreen extends StatelessWidget {
  final int id;
  ProductDetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: APIservice().getSingleProducts(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Product _product = snapshot.data;
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.network(
                      _product.image.toString(),
                      height: 200,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        _product.title.toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Chip(
                      label: Text(_product.category.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      backgroundColor: Colors.blueGrey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("RM" + _product.price.toString(),
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(_product.description.toString())
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart_outlined),
        onPressed: () async {
          await APIservice().updateCart(1, id);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Product added to cart')));
        },
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
