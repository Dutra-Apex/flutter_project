import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var controller3 = TextEditingController();
  var name = '';
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
            ElevatedButton(
                onPressed: isAdmin()
                    ? () => {
                          // Navigator to the next page.
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => AdminPage()),
                          ),
                        }
                    : null,
                child: const Text("Admin only")),
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
              'Enter your username: ',
              fontSize: 25.0,
              textAlign: TextAlign.center,
              fieldColor: Colors.black,
              textColor: Colors.white,
            ),
            TextField(
              controller: controller3,
              onChanged: changeText3,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  hintText: '...', border: OutlineInputBorder()),
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
              '3) On average, how much money do you make on the app per month?',
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

  void changeText3(newText) {
    setState(() => name = newText);
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
    if (text1 == '' || text2 == '' || name == '') {
      return false;
    } else {
      return true;
    }
  }

  bool isAdmin() {
    if (name == 'secret') {
      return true;
    } else {
      return false;
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
    if (int.parse(text2) == 0) {
      results += "\n\n70% of the users also don't make any money from this app.";
    } else {
      results +=
          "\n\nYou and 30% of the users have some sort of income from this app.";
    }
    if (switchValue2 == false) {
      results +=
          '\n\n33% of users also clicked on the ads displayed by the app.';
    } else {
      results +=
          '\n\n67% of users have never clicked on the ads displayed by this app.';
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
    if (int.parse(text1) > 4 && int.parse(text2) == 0 && switchValue2 == false) {
      results += '\n\n\n We recommend that you spend less time on the app. You are not making any money to justify the time you spend on the app';
    } else if (int.parse(text1) > 4 && int.parse(text2) == 0 && switchValue2 == true) {
      results += '\n\n\n You are right in wanting to spend less time on the app, its draining away your time :( .';
    } else if (int.parse(text1) > 4 && int.parse(text2) != 0) {
      results += '\n\n\n Since you are able to make money on the app, we recommend that you spend more time on the app and try to expand your hustle.';
    }
    else {
      results +=
          '\n\nBased on your answers, you spend a reasonable amount of time on TikTok, and you should keep using it.';
    }
    results += "";

    _save();
    return results;
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        controller3.text,
        'Number of hours spent: ${controller1.text} \n'
        'Money Spent on the app: ${controller2.text} \n'
        'Review of the app: $sliderValue1 \n');
  }
}

// Page containing the user's results
class ResultsPage extends StatefulWidget {
  String resultsDisplay;

  ResultsPage({super.key, required this.resultsDisplay});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Here are your results:'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            widget.resultsDisplay,
            style: const TextStyle(
              fontSize: 15,
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

// Page containing the user's results
class AdminPage extends StatefulWidget {
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String _whatWasRead = "";
  var controller = TextEditingController();
  var text = "";

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    _whatWasRead = prefs.getString(controller.text) ?? "";
    setState(() {});
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Here are your results:'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Enter an ID to fetch data from:',
          ),
          TextField(controller: controller),
          ElevatedButton(onPressed: _read, child: const Text('Get previous results')),
          Text(
            _whatWasRead,
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
