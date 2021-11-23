import 'package:flutter/material.dart';
import 'package:project1/screens/product_details.dart';
import 'package:project1/services/apiservice.dart';

class CategoryScreens extends StatelessWidget {
  final String categoryName;
  CategoryScreens(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIservice().getProductByCategory(categoryName),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                  snapshot.data[index]['id'])));
                    },
                    title: Text(snapshot.data[index]['title']),
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 50,
                      width: 30,
                    ),
                    subtitle:
                        Text("RM" + snapshot.data[index]['price'].toString()),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
