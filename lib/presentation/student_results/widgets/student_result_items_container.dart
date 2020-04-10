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
      children: <Widget>[
        Expanded(child: Center(child: firstItem)),
        _buildSeparator(),
        Expanded(child: Center(child: secondItem)),
        _buildSeparator(),
        Expanded(child: Center(child: thirdItem)),
      ],
    );
  }

  Widget _buildSeparator() {
    return SizedBox(width: 12);
  }
}
