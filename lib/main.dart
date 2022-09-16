import 'package:flutter/material.dart';

void main() => runApp(App06Main());

class App06Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyHomePage(),
    );
  }
}

// Four in a column
/*class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My Pet Shop",
              textScaleFactor: 2.0,
            ),
            Text("Cats"),
            Text("Dogs"),
            Text("Giraffes"),
          ],
        ),
      ),
    );
  }
}*/

// Row within a column
/*class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My Pet Shop",
              textScaleFactor: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cats"),
                SizedBox(width: 30),
                Text("Dogs"),
                SizedBox(width: 30),
                Text("Giraffes"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

// Columns within row within column
/*class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My Pet Shop",
              textScaleFactor: 2.0,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: <Widget>[
                    Text(
                      "Household",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                    Text("Cats"),
                    Text("Dogs"),
                    Text("Burds"),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  children: <Widget>[
                    Text(
                      "Exotic",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                    Text("Giraffes"),
                    Text("Bats"),
                    Text("Pangolins"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

// Adding an image
class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            color: Colors.brown,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.yellowAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "My Pet Shop",
                      textScaleFactor: 2.0,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: <Widget>[
                            Text(
                              "Household",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                            ),
                            Text("Cats"),
                            Text("Dogs"),
                            Text("Burds"),
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          children: <Widget>[
                            Text(
                              "Exotic",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            ),
                            Text("Giraffes"),
                            Text("Bats"),
                            Text("Pangolins"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
