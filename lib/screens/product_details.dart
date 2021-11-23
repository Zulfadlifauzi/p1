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
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.network(
                    snapshot.data['image'],
                    height: 200,
                    width: double.infinity,
                  ),
                  Center(
                    child: Text("RM" + snapshot.data['price'].toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
