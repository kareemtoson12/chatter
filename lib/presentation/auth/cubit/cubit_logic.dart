import 'package:chatter/data/models/requests/register_request_model.dart';
import 'package:chatter/domain/usecase/register_usecase.dart';
import 'package:chatter/presentation/auth/cubit/cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final RegisterUseCase registerUseCase;

  AuthCubit(this.registerUseCase) : super(AuthInitial());

  /// Method to handle user registration
  Future<void> registerUser(RegisterRequest request) async {
    emit(AuthLoading());

    final result = await registerUseCase.execute(request);

    result.fold(
      (failure) {
        emit(AuthFailure(failure));
      },
      (response) {
        emit(AuthSuccess(response));
      },
    );
  }
}
