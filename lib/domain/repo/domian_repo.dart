import 'package:chatter/app/network/failure_model.dart';
import 'package:chatter/data/models/requests/login_request_model.dart';
import 'package:chatter/data/models/requests/register_request_model.dart';
import 'package:chatter/data/models/responses/login_response_model.dart';
import 'package:chatter/data/models/responses/register_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class DomianRepo {
  Future<Either<Failure, RegisterResponseModel>> register(
    RegisterRequest request,
  );
  Future<Either<Failure, LoginResponseModel>> login(LoginRequestModel request);
}
