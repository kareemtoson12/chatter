import 'package:chatter/app/network/failure_model.dart';
import 'package:chatter/data/models/responses/register_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthStates extends Equatable {
  const AuthStates();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthSuccess extends AuthStates {
  final RegisterResponseModel response;

  const AuthSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class AuthFailure extends AuthStates {
  final Failure failure;

  const AuthFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
