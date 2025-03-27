import 'package:calories_tracker/core/Api/request_data.dart';
import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<Response> get(String path, {RequestData? requestData});
  Future<Response> post(String path, {Object? body, RequestData? requestData});
  Future<Response> put(String path, {Object? body, RequestData? requestData});
  Future<Response> delete(String path, {RequestData? requestData});
}
