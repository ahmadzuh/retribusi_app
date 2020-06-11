import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
//      height: ScreenUtil().setHeight(500),
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("LOGIN RETRIBUSI",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
                labelText: "Email",
                labelStyle:
                    TextStyle(fontSize: 14, color: Colors.grey.shade400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                labelText: "Password",
                labelStyle:
                    TextStyle(fontSize: 14, color: Colors.grey.shade400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
          ],
        ),
      ),
    );
  }
}
