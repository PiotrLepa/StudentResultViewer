import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:student_result_viewer/core/injection/injection.iconfig.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async => $initGetIt(getIt);
