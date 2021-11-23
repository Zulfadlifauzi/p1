import 'package:flutter/material.dart';
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
            return Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.network(
                    snapshot.data['image'],
                    height: 200,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      snapshot.data['title'],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Chip(
                    label: Text(snapshot.data['category'].toString(),
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    backgroundColor: Colors.blueGrey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("RM" + snapshot.data['price'].toString(),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Expanded(child: Container()),
                      const Icon(Icons.star),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(snapshot.data['rating']['rate'].toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(snapshot.data['description'])
                ],
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
        onPressed: () {},
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
