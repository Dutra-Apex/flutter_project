import 'package:flutter/material.dart';

void main() => runApp(FormApp());

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
            child: Scaffold(
      appBar: AppBar(
        title: Text('Food app'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This is a test",
              style: TextStyle(
                fontSize: 30,
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildRow(
              'You looking for a main dish, dessert or snack?',
              2,
              Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            )
          ],
        ),
      ]),
    )));
  }

  Row buildRow(
    text,
    flex,
    color, {
    fontWeight = FontWeight.normal,
    fontStyle = FontStyle.normal,
  }) {
    return Row(
      children: [
        Expanded(
          flex: flex,
          child: Container(
            color: color,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: fontWeight,
                fontStyle: fontStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
