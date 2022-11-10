import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const FormApp());

class FormApp extends StatefulWidget {
  const FormApp({super.key});

  @override
  State<FormApp> createState() => _FormAppState();
}

class Results {
  String results = "";

  Results(
      this.results,
      );
}

var results = List<Results>.empty(
  growable: true,
);

class _FormAppState extends State<FormApp> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var text1 = '';
  var text2 = '';
  var dropdownValue1 = 0;
  var sliderValue1 = 1.0;
  var sliderValue2 = 1.0;
  var switchValue1 = false;
  var switchValue2 = false;
  var checkBoxValue1 = false;
  var checkBoxValue2 = false;
  var resultsDisplay =
      "Click the Submit button to see how your usage compares with other users.";

  var dropdown1 = [
    const DropdownMenuItem(
      value: 1,
      child: Text("Through online ads"),
    ),
    const DropdownMenuItem(
      value: 2,
      child: Text("A friend reccomended to me"),
    ),
    const DropdownMenuItem(value: 3, child: Text("Saw an influencer using it")),
    const DropdownMenuItem(value: 4, child: Text("It came pre-installed")),
    const DropdownMenuItem(value: 0, child: Text("Other")),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
            child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Software Evaluation App',
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Follow us on Social Media:",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [getTextRow('Social media buttons')],
            ),
          ],
        ),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getTextRow(
              'Regarding the TikTok App',
              fontSize: 35.0,
              textAlign: TextAlign.center,
              fieldColor: Colors.black45,
              textColor: Colors.white,
            ),
            getTextRow(
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
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a number...'),
            ),
            getTextRow(
              '2) How do you review the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            buildSlider(sliderValue1, updateSlider1),
            getTextRow(
              '3) How much money have you spent on the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: controller2,
              onChanged: changeText2,
              textAlign: TextAlign.center,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a number...',
                  prefix: Text(
                    '\$',
                    textAlign: TextAlign.center,
                  ),
                  prefixStyle: TextStyle()),
            ),
            getTextRow(
              '4) Have you ever intentionally clicked on an ad showed by the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            getSwitch(switchValue2, handleSwitch2, '$switchValue2'),
            getTextRow(
              '5) Did you wish you spent less time on the app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            getSwitch(switchValue1, handleSwitch1, '$switchValue1'),
            getTextRow(
              '6) How did you find this app?',
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.lightBlueAccent,
            ),
            DropdownButton<int>(
                items: dropdown1,
                onChanged: refreshScreen,
                value: dropdownValue1,
                hint: const Text(
                  "Select One",
                )),

            // List of questions that I plan on implementing on the final version

            // getTextRow(
            //   'Now tell us some information about you:',
            //   fontSize: 30.0,
            //   textAlign: TextAlign.center,
            //   fieldColor: Colors.black45,
            //   textColor: Colors.white,
            // ),
            // getTextRow(
            //   '1) What country are you from?',
            //   fontSize: 30.0,
            //   textAlign: TextAlign.start,
            //   fieldColor: Colors.green,
            // ),
            // getTextRow('TextField'),
            // getTextRow(
            //   '2) How old are you',
            //   fontSize: 30.0,
            //   textAlign: TextAlign.start,
            //   fieldColor: Colors.green,
            // ),
            // getTextRow('Dropdown menu with age ranges'),
            // getTextRow(
            //   '3) What is your favorite food?',
            //   fontSize: 30.0,
            //   textAlign: TextAlign.start,
            //   fieldColor: Colors.green,
            // ),
            // getTextRow('TextField'),

            getTextRow(
              "Here's how your answers compare to the other users:",
              fontSize: 30.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.red,
            ),
            const SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
                onPressed: getResultValues, child: const Text('Submit')),
            getTextRow(resultsDisplay)
          ],
        ),
      ]),
    )));
  }

  // List of functions to update variables and screenState
  // Need to make this more DRY as soon as I figure out how
  void changeText(newText) {
    setState(() => text1 = newText);
  }

  void changeText2(newText) {
    setState(() => text2 = newText);
  }

  void refreshScreen(newValue) {
    setState(() => dropdownValue1 = newValue);
  }

  void updateSlider1(double newValue) {
    setState(() => sliderValue1 = newValue);
  }

  void updateSlider2(double newValue) {
    setState(() => sliderValue2 = newValue);
  }

  void handleSwitch1(newValue) {
    setState(() => switchValue1 = newValue);
  }

  void handleSwitch2(newValue) {
    setState(() => switchValue2 = newValue);
  }

  void handleCheckBox1(newValue) {
    setState(() => checkBoxValue1 = newValue);
  }

  void handleCheckBox2(newValue) {
    setState(() => checkBoxValue2 = newValue);
  }

  Widget buildSlider(sliderValue, updateSlider) {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        const Text("1 for very bad, 10 for life changing"),
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

  // Function that returns a row with text on it and customed background
  Row getTextRow(
    text, {
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

  // Function to get the results based on the user answers
  // Updates the 'results_display' variable and updates the screen state
  getResultValues() {
    //var results = '';
    if (int.parse(text1) < 3) {
      results.add( Results(
          'You spend little to no time on the App. 68% of users spend 3+ hours on the app.'));
    } else {
      results.add( Results ( 'You spent as much time as 68% of the users.'));
    }
    // if (sliderValue1 >= 5) {
    //   results += "\n\nYou're as satisfied with this app as 22% of the users.";
    // } else {
    //   results += "\n\nYou're as satisfied with this app as 78% of the users.";
    // }
    // if (int.parse(text2) < 50) {
    //   results += "\n\nYou spent less money than 58% of the users.";
    // } else {
    //   results +=
    //       "\n\n42% percent of users spent as much money as you did (or more)";
    // }
    // if (switchValue2 == false) {
    //   results +=
    //       '\n\n33% of users also clicked on the ads displayed by the app';
    // } else {
    //   results +=
    //       '\n\n67% of users have never clicked on the ads displayed by this app';
    // }
    // if (switchValue1 == false) {
    //   results +=
    //       '\n\nOnly 7% of users are satisfied with the amount of time they spent on the app ';
    // } else {
    //   results += "\n\n93% of users also wish they spent less time on the app";
    // }
    // if (dropdownValue1 == 1) {
    //   results += "\n\n You and other 33% of users found this app through ads";
    // } else if (dropdownValue1 == 2) {
    //   results += "\n\n About 22% of users found this app through friends";
    // } else if (dropdownValue1 == 3) {
    //   results += "\n\n About 45% of users found this app through influencers";
    // } else if (dropdownValue1 == 4) {
    //   results += "\n\n Only 8% of users had this app pre-installed";
    // }
    //resultsDisplay = results;
    //setState(() {});
    () => goToResultsPage(results);
  }

  goToResultsPage(results) async {
    Results results =  await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultsPage(),
      settings: RouteSettings(
        arguments: resultsDisplay,
      ),
      ),
    );
  }

}

class ResultsPage extends StatefulWidget{
  @override
  State<ResultsPage> createState() => _ResultsPageState();
}


class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context){
    var results = ModalRoute.of(context)!.settings.arguments as Results;
    return Material(
      child: Column(
        children: [
          Row(
           children: [
             Text(results.results),
           ] ,
          )
        ]
      )
    );
  }
}

