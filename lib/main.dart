import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(FormApp());

class FormApp extends StatefulWidget {
  @override
  State<FormApp> createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var text1 = '';
  var text2 = '';
  var dropdownValue1;
  var slidervalue1 = 1.0;
  var slidervalue2 = 1.0;
  var switchValue1 = false;
  var switchValue2 = false;
  var checkBoxValue1 = false;
  var checkBoxValue2 = false;
  var results_display = 'test';

  var dropdown1 = [
    DropdownMenuItem(
      value: 1,
      child: Text("Through online ads"),
    ),
    DropdownMenuItem(
      value: 2,
      child: Text("A friend reccomended to me"),
    ),
    DropdownMenuItem(value: 3, child: Text("Saw an influencer using it")),
    DropdownMenuItem(value: 4, child: Text("It came pre-installed")),
    DropdownMenuItem(value: 0, child: Text("Other")),
  ];

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
              children: [getTexRow('Social media buttons')],
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
            TextField(
              keyboardType: TextInputType.number,
              controller: controller1,
              onChanged: changeText,
              textAlign: TextAlign.center,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a number...'),
            ),
            getTexRow(
              '2) How do you review the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            buildSlider(slidervalue1, updateSlider1),
            getTexRow(
              '3) How much money have you spent on the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: controller2,
              //onChanged: changeText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number...',
                prefix: Text(
                  '\$',
                  textAlign: TextAlign.center,
                ),
                //prefixStyle: TextStyle()
              ),
            ),
            getTexRow(
              '4) Have you ever intentionally clicked on an ad showed by the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            getSwitch(switchValue2, handleSwitch2, '$switchValue2'),
            getTexRow(
              '5) Did you wish you spent less time on the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            getSwitch(switchValue1, handleSwitch1, '$switchValue1'),
            getTexRow(
              '6) How did you find this app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            DropdownButton<int>(
                items: dropdown1,
                onChanged: refreshScreen,
                value: dropdownValue1,
                hint: Text(
                  "Select One",
                )),
            // getTexRow(
            //   'Now tell us some information about you:',
            //   fontSize: 30.0,
            //   textAlign: TextAlign.center,
            //   fieldColor: Colors.black45,
            //   textColor: Colors.white,
            // ),
            // getTexRow(
            //   '1) What country are you from?',
            //   fontSize: 30.0,
            //   textAlign: TextAlign.start,
            //   fieldColor: Colors.green,
            // ),
            // getTexRow('TextField'),
            // getTexRow(
            //   '2) How old are you',
            //   fontSize: 30.0,
            //   textAlign: TextAlign.start,
            //   fieldColor: Colors.green,
            // ),
            // getTexRow('Dropdown menu with age ranges'),
            // getTexRow(
            //   '3) What is your favorite food?',
            //   fontSize: 30.0,
            //   textAlign: TextAlign.start,
            //   fieldColor: Colors.green,
            // ),
            // getTexRow('TextField'),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(onPressed: getResultValues, child: Text('Submit')),
            getTexRow(
              "Here's how your answers compare to the other users:",
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.red,
            ),
            getTexRow(results_display)
          ],
        ),
      ]),
    )));
  }

  void changeText(newText) {
    setState(() => text1 = newText);
  }

  void refreshScreen(newValue) {
    setState(() => dropdownValue1 = newValue);
  }

  void updateSlider1(double newValue) {
    setState(() => slidervalue1 = newValue);
  }

  void updateSlider2(double newValue) {
    setState(() => slidervalue2 = newValue);
  }

  void handleSwitch1(newValue) {
    //print(newValue);
    setState(() => switchValue1 = newValue);
  }

  void handleSwitch2(newValue) {
    //print(newValue);
    setState(() => switchValue2 = newValue);
  }

  void handleCheckBox1(newValue) {
    //print(newValue);
    setState(() => checkBoxValue1 = newValue);
  }

  void handleCheckBox2(newValue) {
    //print(newValue);
    setState(() => checkBoxValue2 = newValue);
  }

  Widget buildSlider(sliderValue, updateSlider) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text("Test"),
        Slider(
            min: 1.0,
            max: 10.0,
            divisions: 9,
            value: sliderValue,
            onChanged: updateSlider,
            label: '${sliderValue.toInt()}')
      ],
    );
  }

  Row getSwitch(
    value,
    onChanged,
    text,
  ) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Switch(value: value, onChanged: onChanged), Text(text)]);
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

  getResultValues() {
    var results = '';
    if (int.parse(text1) < 3) {
      results +=
          'You spend little to no time on the App. 68% of users spend 3+ hours on the app.';
    } else {
      results += 'You spent as much time as 68% of the users.';
    }
    if (slidervalue1 >= 5) {
      results += "\n\nYou're as satisfied with this app as 22% of the users.";
    } else {
      results += "\n\nYou're as satisfied with this app as 78% of the users.";
    }
    if (switchValue2 == false) {
      results +=
          '\n\n33% of users also clicked on the ads displayed by the app';
    } else {
      results +=
          '\n\n67% of users have never clicked on the ads displayed by this app';
    }
    if (switchValue1 == false) {
      results +=
          '\n\nOnly 7% of users are satisfied with the amount of time they spent on the app ';
    } else {
      results += "\n\n93% of users also wish they spent less time on the app";
    }

    results_display = results;
    setState(() {});
  }

  // Row getResults() {
  //   return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
  //     Text(
  //       getResultValues(),
  //       textScaleFactor: 1.2,
  //     )
  //   ]);
  // }
}

// https://docs.flutter.dev/cookbook/forms/text-input
// https://stackoverflow.com/questions/65849904/how-to-add-dollar-sign-on-the-right-hand-side-of-the-textfield-in-flutter-app
