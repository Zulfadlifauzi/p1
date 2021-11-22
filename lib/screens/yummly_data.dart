import 'package:flutter/material.dart';

class YummlyScreen extends StatefulWidget {
  const YummlyScreen({Key? key}) : super(key: key);

  @override
  _YummlyScreenState createState() => _YummlyScreenState();
}

class _YummlyScreenState extends State<YummlyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Restaurant Menu')
          ],
        ),
      ),
    );
  }
}
