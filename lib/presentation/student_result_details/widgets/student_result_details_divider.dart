import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentResultDetailsDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      thickness: 1,
      color: Theme.of(context).primaryColorLight,
      indent: 20,
      endIndent: 20,
    );
  }
}
