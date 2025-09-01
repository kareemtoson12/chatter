import 'package:chatter/data/requests/register_request_model.dart';
import 'package:chatter/data/responses/register_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: "http://connectzone.runasp.net/api/")
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  //register
  @POST('Account/register')
  Future<RegisterResponseModel> register(
    @Queries() Map<String, dynamic> queries,
  );
}
