import 'package:flutter/material.dart';
import 'package:project1/screens/all_category.dart';
import 'package:project1/screens/cart_product.dart';
import 'package:project1/screens/product_details.dart';
import 'package:project1/services/apiService.dart';

class StoreHome extends StatefulWidget {
  const StoreHome({Key? key}) : super(key: key);

  @override
  _StoreHomeState createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hood Store'),
        elevation: 0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllCategory()));
              },
              icon: Icon(Icons.view_list)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: FutureBuilder(
        future: APIservice().getAllPosts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
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
                  }),
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
