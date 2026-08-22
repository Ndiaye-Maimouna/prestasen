import 'package:dio/dio.dart';
import '../errors/failure_mapper.dart';

Future<T> repositoryGuard<T>(Future<T> Function() action) async {
  try {
    return await action();
  } on DioException catch (e) {
    throw FailureMapper.fromDioException(e);
  }
}