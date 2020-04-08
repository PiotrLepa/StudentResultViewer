import 'package:student_result_viewer/core/common/logger/logger.dart';
import 'package:student_result_viewer/core/data/network/exception/api/api_exception.dart';
import 'package:student_result_viewer/core/domain/call_state/call_state.dart';
import 'package:student_result_viewer/core/domain/error/error_translator.dart';
import 'package:student_result_viewer/core/injection/injection.dart';

Stream<CallState<T>> fetch<T>(
  Future<T> call,
) async* {
  try {
    yield CallState.progress();
    final result = await call;
    yield CallState.success(result);
  } on ApiException catch (e) {
    final errorMessage = getIt.get<ErrorTranslator>().translate(e);
    yield CallState.error(errorMessage);
  } catch (e, s) {
    logger.e("bloc helper fetch", e, s);
  }
}
