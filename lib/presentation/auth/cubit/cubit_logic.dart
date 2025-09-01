import 'package:chatter/data/models/requests/login_request_model.dart';
import 'package:chatter/data/models/requests/register_request_model.dart';
import 'package:chatter/domain/usecase/login_usecase.dart';
import 'package:chatter/domain/usecase/register_usecase.dart';
import 'package:chatter/presentation/auth/cubit/cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final RegisterUseCase registerUseCase;
  final LoginUsecase loginUsecase;

  AuthCubit(this.registerUseCase, this.loginUsecase) : super(AuthInitial());

  /// Method to handle user registration
  Future<void> registerUser(RegisterRequest request) async {
    emit(AuthLoading());

    final result = await registerUseCase.registerExecute(request);

    result.fold(
      (failure) {
        emit(AuthFailure(failure));
      },
      (response) {
        emit(AuthSuccess(response));
      },
    );
  }

  //login
  Future<void> loginUser(LoginRequestModel request) async {
    emit(AuthLoading());

    final result = await loginUsecase.loginExecute(request);

    result.fold(
      (failure) {
        emit(AuthFailure(failure));
      },
      (response) {
        emit(LoginSuccess(response));
      },
    );
  }
}
