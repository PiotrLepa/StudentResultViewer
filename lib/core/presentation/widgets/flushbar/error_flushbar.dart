import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_result_viewer/core/common/raw_key_string.dart';
import 'package:student_result_viewer/core/presentation/localization/app_localizations.dart';
import 'package:student_result_viewer/core/presentation/widgets/flushbar/app_flushbar.dart';

// ignore: must_be_immutable
class ErrorFlushbar extends AppFlushbar {
  ErrorFlushbar({
    Key key,
    @required BuildContext context,
    @required RawKeyString message,
    @required VoidCallback onDismiss,
    RawKeyString title,
  }) : super(
          title: title ??
              AppLocalizations.of(context).translate('errorFlushbarTitle'),
          message: AppLocalizations.of(context).get(message),
          backgroundColor: Theme.of(context).errorColor,
          icon: Icon(
            Icons.warning,
            color: Colors.white,
          ),
          onDismiss: onDismiss,
        );
}
