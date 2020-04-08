import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_route.dart' as flushbarRoute;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:student_result_viewer/core/common/raw_key_string.dart';
import 'package:student_result_viewer/core/common/router/router.gr.dart';
import 'package:student_result_viewer/core/presentation/widgets/flushbar/app_flushbar.dart';
import 'package:student_result_viewer/core/presentation/widgets/flushbar/error_flushbar.dart';

@lazySingleton
class FlushbarHelper {
  BuildContext get _context => ExtendedNavigator.ofRouter<Router>().context;

  bool _isFlushbarVisible = false;

  void dismiss() {
    if (_isFlushbarVisible) {
      _isFlushbarVisible = false;
      ExtendedNavigator.ofRouter<Router>().pop();
    }
  }

  Future<void> showError({
    @required RawKeyString message,
    RawKeyString title,
  }) =>
      _showFlushbar(
        flushbar: ErrorFlushbar(
          context: _context,
          title: title,
          message: message,
          onDismiss: _onFlushbarDismiss,
        ),
      );

  Future<void> _showFlushbar({
    @required AppFlushbar flushbar,
  }) async {
    if (_isFlushbarVisible) {
      return;
    }
    _isFlushbarVisible = true;
    await Future.delayed(Duration(milliseconds: 200));
    return ExtendedNavigator.ofRouter<Router>().push(
      flushbarRoute.showFlushbar(
        context: _context,
        flushbar: flushbar,
      ),
    );
  }

  void _onFlushbarDismiss() {
    _isFlushbarVisible = false;
  }
}
