import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_result_viewer/core/domain/bloc/error_logger_bloc_delegate.dart';
import 'package:student_result_viewer/core/injection/injection.dart';
import 'package:student_result_viewer/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  BlocSupervisor.delegate = ErrorLoggerBlocDelegate();
  runApp(App());
}
