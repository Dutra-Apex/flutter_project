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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Follow us on Social Media:",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            getTexRow(
              'Social media buttons'
            )
              ],
            ),
          ],
        ),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getTexRow(
              'Regarding the App X...',
              fontSize: 35.0,
              textAlign: TextAlign.center,
              fieldColor: Colors.black45,
              textColor: Colors.white,
            ),
            getTexRow(
              '1) How many hours per day do you use this app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            getTexRow(
              'TextField (takes only numbers)',
            ),
            getTexRow(
              '2) How do you review the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            getTexRow('Likert Scale'),
            getTexRow(
              '3) How much money have you spent on the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            getTexRow('Texfield (takes only numbers)'),
            getTexRow(
              '4) Have you ever intentionally clicked on an ad showed by the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            getTexRow('Selection menu (yes/no)'),
            getTexRow(
              '5) Did you wish you spent less time on the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            getTexRow('Selection Menu'),
            getTexRow(
              '6) How did you find this app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            getTexRow("Dropdown menu (Ad, friend, etc)"),
            getTexRow(
              'Now tell us some information about you:',
              fontSize: 30.0,
              textAlign: TextAlign.center,
              fieldColor: Colors.black45,
              textColor: Colors.white,
            ),
            getTexRow(
              '1) What country are you from?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.green,
            ),
            getTexRow('TextField'),
            getTexRow(
              '2) How old are you',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.green,
            ),
            getTexRow('Dropdown menu with age ranges'),
            getTexRow(
              '3) What is your favorite food?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.green,
            ),
            getTexRow('TextField'),
            getTexRow(
              "Here's how your answers compare to the other users:",
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.red,
            ),
            getTexRow(
              'Some graphs displaying how the user compares with the others'
            )
          ],
        ),
      ]),
    )));
  }

  Row getTexRow(
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
