import 'package:chatter/app/network/failure_model.dart';
import 'package:chatter/data/models/requests/login_request_model.dart';
import 'package:chatter/data/models/responses/login_response_model.dart';
import 'package:chatter/domain/repo/domian_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final DomianRepo _repo;

  LoginUsecase(this._repo);

  Future<Either<Failure, LoginResponseModel>> loginExecute(
    LoginRequestModel request,
  ) {
    return _repo.login(request);
  }
}
