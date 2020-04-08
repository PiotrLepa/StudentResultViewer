library api_exception;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
abstract class ApiException with _$ApiException implements Exception {
  const factory ApiException.noConnection(
    int code,
  ) = NoConnection;

  const factory ApiException.badRequest(
    int code,
  ) = BadRequest;

  const factory ApiException.notFound(
    int code,
  ) = NotFound;

  const factory ApiException.internalServerError(
    int code,
  ) = InternalServerError;

  const factory ApiException.unknownError(
    int code,
  ) = UnknownError;
}
