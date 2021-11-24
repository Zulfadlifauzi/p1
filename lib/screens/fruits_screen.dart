import 'package:flutter/material.dart';
import 'package:project1/models/fruits_model.dart';
import 'package:project1/services/apiservice.dart';

class FruitScreen extends StatefulWidget {
  const FruitScreen({Key? key}) : super(key: key);

  @override
  _FruitScreenState createState() => _FruitScreenState();
}

class _FruitScreenState extends State<FruitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits Hood'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
        future: APIservice().getAllFruits(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Fruit _fruit = snapshot.data[index];
                return Card(
                  child: ListTile(
                    title: Center(
                      child: Text(_fruit.name.toString()),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              'Carbohydrates: ${_fruit.nutritions!.carbohydrates}'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('Carbohydrates: ${_fruit.nutritions!.protein}'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('Carbohydrates: ${_fruit.nutritions!.fat}'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('Carbohydrates: ${_fruit.nutritions!.calories}'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('Carbohydrates: ${_fruit.nutritions!.sugar}'),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
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
