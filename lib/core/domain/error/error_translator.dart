import 'package:injectable/injectable.dart';
import 'package:student_result_viewer/core/common/raw_key_string.dart';
import 'package:student_result_viewer/core/data/network/exception/api/api_exception.dart';

@lazySingleton
class ErrorTranslator {
  RawKeyString translate(ApiException exception) {
    final keyString = exception.map(
      noConnection: (value) => "apiErrorNoConnection",
      badRequest: (value) => "apiErrorBadRequest",
      notFound: (value) => "apiErrorNotFound",
      internalServerError: (value) => "apiErrorInternalServerError",
      unknownError: (value) => "apiErrorUnknown",
    );
    return KeyString(keyString);
  }
}
