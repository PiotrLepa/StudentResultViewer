import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentResultsHeaderItem extends StatelessWidget {
  final String headerText;
  final bool isSelected;

  const StudentResultsHeaderItem({
    Key key,
    @required this.headerText,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              headerText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
