import 'package:flutter/material.dart';

class ChildWidget extends StatelessWidget {
  final AvailableNumber number;

  const ChildWidget({Key key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String file = "";
    if (number == AvailableNumber.First) {
      file = "Home";
    } else if (number == AvailableNumber.Second) {
      file = "Explore";
    } else {
      file = "Settings";
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "$file screen",
              style: TextStyle(fontSize: 36.0),
            ),
          ),
          // Flexible(child: Image.asset("assets/undraw/$file.png"))
        ],
      ),
    );
  }
}

enum AvailableNumber { First, Second, Third }
