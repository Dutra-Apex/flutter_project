import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FormApp(),
    );
  }
}

class FormApp extends StatefulWidget {
  const FormApp({super.key});

  @override
  State<FormApp> createState() => _FormAppState();
}

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
      child: Text("A friend recommended to me"),
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
        backgroundColor: Colors.black38,
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
              fontSize: 25.0,
              textAlign: TextAlign.center,
              fieldColor: Colors.black,
              textColor: Colors.white,
            ),
            getTextRow(
              '1) How many hours per day do you use this app?',
              fontSize: 20.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.white,
            ),
            getTextField(controller1, changeText),
            getTextRow(
              '2) How do you review the app?',
              fontSize: 20.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.white,
            ),
            buildSlider(sliderValue1, updateSlider1),
            getTextRow(
              '3) How much money have you spent on the app?',
              fontSize: 20.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.white,
            ),
            getTextField(controller2, changeText2),
            getTextRow(
              '4) Have you ever intentionally clicked on an ad showed by the app?',
              fontSize: 20.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.white,
            ),
            getSwitch(switchValue2, handleSwitch2, '$switchValue2'),
            getTextRow(
              '5) Did you wish you spent less time on the app?',
              fontSize: 20.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.white,
            ),
            getSwitch(switchValue1, handleSwitch1, '$switchValue1'),
            getTextRow(
              '6) How did you find this app?',
              fontSize: 20.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.white,
            ),
            getDropDown(dropdown1, refreshScreen, dropdownValue1),

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
              fontSize: 20.0,
              textAlign: TextAlign.start,
              fieldColor: Colors.white,
            ),
            const SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
                onPressed: isUserDone()
                    ? () => {
                          // Navigator to the next page.
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ResultsPage(
                                resultsDisplay: getResultValues(),
                              ),
                            ),
                          ),
                        }
                    : null,
                child: const Text("Submit")),
            getTextRow(userMessage(isUserDone()))
          ],
        ),
      ]),
    )));
  }

  // List of functions to update variables and screenState
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

  bool isUserDone() {
    if (text1 == '' || text2 == '') {
      return false;
    } else {
      return true;
    }
  }

  String userMessage(
    isUserDone,
  ) {
    if (isUserDone) {
      return "Now you can click the submit button";
    } else {
      return "Please finish the form to see your results";
    }
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

  TextField getTextField(
    controller,
    onChanged, {
    keyboardType = TextInputType.number,
  }) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      textAlign: TextAlign.center,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      style: const TextStyle(
        fontSize: 20,
      ),
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: 'Enter a number...'),
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

  // Function that returns a row with text on it and custom background
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

  DropdownButton getDropDown(
    items,
    onChanged,
    value,
  ) {
    return DropdownButton<int>(
      items: items,
      onChanged: onChanged,
      value: value,
      hint: const Text(
        "Select One",
      ),
    );
  }

  // Function to get the results based on the user answers
  // Returns a string "results"
  getResultValues() {
    var results = '';
    if (int.parse(text1) < 3) {
      results +=
          'You spend little to no time on the App. 68% of users spend 3+ hours on the app.';
    } else {
      results += 'You spent as much time as 68% of the users.';
    }
    if (sliderValue1 >= 5) {
      results += "\n\nYou're as satisfied with this app as 22% of the users.";
    } else {
      results += "\n\nYou're as satisfied with this app as 78% of the users.";
    }
    if (int.parse(text2) < 50) {
      results += "\n\nYou spent less money than 58% of the users.";
    } else {
      results +=
          "\n\n42% percent of users spent as much money as you did (or more)";
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
    if (dropdownValue1 == 1) {
      results += "\n\n You and other 33% of users found this app through ads.";
    } else if (dropdownValue1 == 2) {
      results += "\n\n About 22% of users found this app through friends.";
    } else if (dropdownValue1 == 3) {
      results += "\n\n About 45% of users found this app through influencers.";
    } else if (dropdownValue1 == 4) {
      results += "\n\n Only 8% of users had this app pre-installed.";
    }
    if (int.parse(text1) > 4) {
      results +=
      '\n\nBased on your answers, you should spend less time on TikTok.';
    } else {
      results += '\n\nBased on your answers, you spend a reasonable amount of time on TikTok, and you should keep using it.';
    }
    results += "";
    return results;
  }
}

// Page containing the user's results
class ResultsPage extends StatelessWidget {
  String resultsDisplay;
  ResultsPage({super.key, required this.resultsDisplay});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Here are your results:'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            resultsDisplay,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
              child: const Text(
                'Go Back',
                textScaleFactor: 1.5,
              ),
              onPressed: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) => const FormApp(),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
