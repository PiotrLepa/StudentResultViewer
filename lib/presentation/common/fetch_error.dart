import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/core/common/extension/build_context_extension.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorView({
    Key key,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error_outline,
            size: 100,
          ),
          SizedBox(height: 16),
          Text(
            context.translateKey('fetchError'),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 40),
          FlatButton(
            onPressed: onRetry,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              child: Text(context.translateKey('fetchErrorRetry')),
            ),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
