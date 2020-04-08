import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_type.dart';

class StudentResultsHeaderItem extends StatelessWidget {
  final String headerText;
  final StudentResultSortType sortType;
  final VoidCallback onTap;

  const StudentResultsHeaderItem({
    Key key,
    @required this.headerText,
    @required this.onTap,
    @required this.sortType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = const BorderRadius.all(Radius.circular(16));
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: borderRadius,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildText(),
                _buildIcon(),
              ],
            ),
          ),
        ),
      ),
    );
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildText(),
              _buildIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      headerText,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      _getIconData(),
      color: Colors.white,
      size: 24,
    );
  }

  // ignore: missing_return
  IconData _getIconData() {
    switch (sortType) {
      case StudentResultSortType.ascending:
        return Icons.arrow_downward;
      case StudentResultSortType.descending:
        return Icons.arrow_upward;
      case StudentResultSortType.unsorted:
        return Icons.close;
    }
  }
}
