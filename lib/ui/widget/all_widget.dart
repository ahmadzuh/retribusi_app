import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/const/color.dart';

//SCAFFOLDS-----------------------------------
Widget primaryContainer(
  Widget containerChild,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    color: ColorBase.primaryWhiteSmoke,
    child: containerChild,
  );
}
//--------------------------------------------

Widget listTileButton(
  void Function() onPressed,
  String iconImage,
  String listTileName,
  Color color,
) {
  return SizedBox(
    height: 60.0,
    width: double.infinity,
    child: RawMaterialButton(
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            iconImage,
            height: 20,
            color: ColorBase.grey,
          ),
          SizedBox(width: 15.0),
          Expanded(
            child: Text(
              listTileName,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[400],
            size: 16.0,
          ),
        ],
      ),
    ),
  );
}
//-------------------------------------------
