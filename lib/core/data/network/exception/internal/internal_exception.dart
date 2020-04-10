library internal_exception;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'internal_exception.freezed.dart';

@freezed
abstract class InternalException with _$InternalException implements Exception {
  const factory InternalException.noConnection() = NoConnection;
}
