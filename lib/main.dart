import 'package:flutter/material.dart';

void main() => runApp(FormApp());

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
            child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Software Evaluation App',
          textAlign: TextAlign.center,
        ),
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
            buildRow(
              'Test'
            )
          ],
        ),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildRow(
              'Regarding the App X...',
              fontSize: 35.0,
              textAlign: TextAlign.center,
              fieldColor: Colors.black45,
              textColor: Colors.white,
            ),
            buildRow(
              '1) How many hours per day do you use this app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            buildRow(
              'TextField (takes only numbers)',
            ),
            buildRow(
              '2) How to you review the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            buildRow('Likert Scale'),
            buildRow(
              '3) How much money have you spent on the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            buildRow('Texfield (takes only numbers)'),
            buildRow(
              '4) Have you ever intentionally clicked on an add showed by the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            buildRow('Selection menu (yes/no)'),
            buildRow(
              '5) Did you wish you spent less time on the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            buildRow('Selection Menu'),
            buildRow(
              '6) How did you find this app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            buildRow("Dropdown menu (Ad, friend, etc)"),
            buildRow(
              '7) Did you wish you spent less time on the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            buildRow(
              'Now tell us some information about you:',
              fontSize: 30.0,
              textAlign: TextAlign.center,
              fieldColor: Colors.black45,
              textColor: Colors.white,
            ),
            buildRow(
              '1) What country are you from?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.green,
            ),
            buildRow('TextField'),
            buildRow(
              '2) How old are you',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.green,
            ),
            buildRow('Dropdown menu with age ranges'),
            buildRow(
              '3) What is your favorite food?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.green,
            ),
            buildRow('TextField'),
            buildRow(
              "Here's how your answers compare to the other users:",
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.red,
            ),
            buildRow(
              'Some graphs displaying how the user compares with the others'
            )
          ],
        ),
      ]),
    )));
  }

  Row buildRow(
    text, {
    //height = 25.0,
    //width = 100.0,
    fieldColor = Colors.white,
    textAlign = TextAlign.center,
    fontSize = 25.0,
    textColor = Colors.black,
    fontWeight = FontWeight.normal,
    fontStyle = FontStyle.normal,
  }) {
    return Row(
      children: [
        Expanded(
          child: Container(
            //height: height,
            //width: width,
            color: fieldColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text,
                textAlign: textAlign,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  fontStyle: fontStyle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
