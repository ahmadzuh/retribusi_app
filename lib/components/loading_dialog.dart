import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void loadingDialog({BuildContext context, String msg}) {
  showDialog(
      context: context,
      builder: (context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            content: Row(
              children: [
                CupertinoActivityIndicator(),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(msg),
                )
              ],
            ),
          );
        } else {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(msg),
                )
              ],
            ),
          );
        }
      });
}
