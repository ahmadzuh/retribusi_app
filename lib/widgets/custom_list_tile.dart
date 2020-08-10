import 'package:flutter/material.dart';

class CustomListTileIcon extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;

  CustomListTileIcon({this.icon, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 1.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, .255)),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.black))),
              child: Icon(icon),
            ),
            title: Text(
              title,
              style: TextStyle(
                  color: Colors.blueGrey[800], fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(color: Colors.blueGrey[800], fontSize: 13.0),
            ),
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.blueGrey[800], size: 28.0),
          ),
        ),
      ),
    );
  }
}

class CustomListTileHistory extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;

  CustomListTileHistory({this.icon, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 1.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, .255)),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.black))),
            child: Icon(icon),
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.blueGrey[800], fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.blueGrey[800], fontSize: 13.0),
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.blueGrey[800], size: 28.0),
        ),
      ),
    );
  }
}
