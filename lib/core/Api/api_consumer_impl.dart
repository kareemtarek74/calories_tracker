import 'package:dio/dio.dart';
import 'package:kareem_tarek/core/Api/api_consumer.dart';
import 'package:kareem_tarek/core/Api/http_service.dart';
import 'package:kareem_tarek/core/Api/request_data.dart';

class ApiConsumerImpl implements ApiConsumer {
  final HttpService httpService;

  ApiConsumerImpl({required this.httpService});

  @override
  Future<Response> get(String path, {RequestData? requestData}) async {
    return await httpService.get(path, requestData: requestData);
  }

  @override
  Future<Response> post(String path,
      {Object? body, RequestData? requestData}) async {
    return await httpService.post(path, body!, requestData: requestData);
  }

  @override
  Future<Response> put(String path,
      {Object? body, RequestData? requestData}) async {
    return await httpService.put(path,
        requestBody: body, requestData: requestData);
  }

  @override
  Future<Response> delete(String path, {RequestData? requestData}) async {
    return await httpService.delete(path, requestData: requestData);
  }
}
