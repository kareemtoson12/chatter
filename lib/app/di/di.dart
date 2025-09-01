import 'package:chatter/data/repository/repo_imp.dart';
import 'package:chatter/data/source/retrofit.dart';
import 'package:chatter/domain/repo/domian_repo.dart';
import 'package:chatter/domain/usecase/register_usecase.dart';
import 'package:chatter/presentation/auth/cubit/cubit_logic.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance; // sl = service locator

Future<void> init() async {
  // ----------------------------
  // Cubit
  // ----------------------------
  sl.registerFactory(() => AuthCubit(sl())); // sl() inject RegisterUseCase

  // ----------------------------
  // UseCases
  // ----------------------------
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // ----------------------------
  // Repositories
  // ----------------------------
  sl.registerLazySingleton<DomianRepo>(() => RegisterRepositoryImpl(sl()));

  // ----------------------------
  // Remote DataSource (Retrofit)
  // ----------------------------
  final dio = Dio();
  final appServiceClient = AppServiceClient(dio);
  sl.registerLazySingleton(() => appServiceClient);
}
