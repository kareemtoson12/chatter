import 'package:chatter/app/network/failure_model.dart';
import 'package:chatter/data/models/requests/register_request_model.dart';
import 'package:chatter/domain/repo/domian_repo.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/responses/register_response_model.dart';

class RegisterUseCase {
  final DomianRepo repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, RegisterResponseModel>> execute(
    RegisterRequest request,
  ) {
    return repository.register(request);
  }
}
