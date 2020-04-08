import 'package:flutter/widgets.dart';

class StudentResultItemsContainer extends StatelessWidget {
  final Widget firstItem;
  final Widget secondItem;
  final Widget thirdItem;

  const StudentResultItemsContainer({
    Key key,
    @required this.firstItem,
    @required this.secondItem,
    @required this.thirdItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(child: firstItem),
        Expanded(child: secondItem),
        Expanded(child: thirdItem),
      ],
    );
  }
}
