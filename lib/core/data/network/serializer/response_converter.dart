import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:student_result_viewer/core/data/network/serializer/json_factories.dart';

typedef T JsonFactory<T>(Map<String, dynamic> json);

@lazySingleton
class ResponseConverter {
  Future<T> decodeResponse<T>(
    Future<Response> futureResponse,
  ) async {
    final response = await futureResponse;
    final data = _decodeJson<T>(response.data);
    return data;
  }

  Future<KtList<T>> decodeResponseList<T>(
    Future<Response> futureResponse,
  ) async {
    final response = await futureResponse;
    final data = _decodeJson<T>(response.data);
    return KtList.from(data);
  }

  dynamic _decodeJson<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity);

    if (entity is Map) return _decodeMap<T>(entity);

    return entity;
  }

  List<T> _decodeList<T>(List values) =>
      values.where((v) => v != null).map<T>((v) => _decodeJson<T>(v)).toList();

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = jsonFactories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      throw Exception(
          "Json factory for type $T not found. Check if class is added to converters.");
    }
    return jsonFactory(values);
  }
}
