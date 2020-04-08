import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_result_viewer/core/common/logger/logger.dart';

class ErrorLoggerBlocDelegate extends BlocDelegate {
  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    logger.e(bloc, error, stacktrace);
    super.onError(bloc, error, stacktrace);
  }
}
