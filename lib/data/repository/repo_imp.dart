import 'package:chatter/app/network/error_handling.dart';
import 'package:chatter/app/network/failure_model.dart';
import 'package:chatter/data/models/requests/register_request_model.dart';
import 'package:chatter/domain/repo/domian_repo.dart';
import 'package:dartz/dartz.dart';

import '../source/retrofit.dart';
import '../models/responses/register_response_model.dart';

class RegisterRepositoryImpl implements DomianRepo {
  final AppServiceClient _remoteDataSource;

  RegisterRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
    RegisterRequest request,
  ) async {
    try {
      final response = await _remoteDataSource.register(request.toJson());
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
