import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Widget icon;
  final String hint;
  final bool obscureText;

  final VoidCallback helpOnTap;
  final Widget helpContent;

  AppTextField(
      {@required this.icon,
      @required this.hint,
      this.obscureText,
      this.helpOnTap,
      this.helpContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black38),
              prefixIcon: icon,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12))),
        ),
        if (helpContent != null && helpContent != null)
          Container(
              height: 48.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: helpOnTap,
                  child: helpContent,
                ),
              )),
      ],
    );
  }
}
