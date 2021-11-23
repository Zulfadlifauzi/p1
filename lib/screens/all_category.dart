import 'package:flutter/material.dart';
import 'package:project1/screens/category_product.dart';
import 'package:project1/services/apiservice.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIservice().getAllCategory(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryScreens(snapshot.data[index])));
                  },
                  child: Card(
                    elevation: 2,
                    margin: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          snapshot.data[index].toString().toUpperCase(),
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                );
              },
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
