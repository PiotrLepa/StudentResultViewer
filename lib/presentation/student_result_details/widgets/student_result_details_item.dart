import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentResultDetailsItem extends StatelessWidget {
  final String header;
  final String content;

  const StudentResultDetailsItem({
    Key key,
    @required this.header,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          header,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        SizedBox(height: 5),
        Text(
          content,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
