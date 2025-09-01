import 'package:chatter/app/network/dio_factory.dart';
import 'package:chatter/data/repository/repo_imp.dart';
import 'package:chatter/data/source/retrofit.dart';
import 'package:chatter/domain/repo/domian_repo.dart';
import 'package:chatter/domain/usecase/login_usecase.dart';
import 'package:chatter/domain/usecase/register_usecase.dart';
import 'package:chatter/presentation/auth/cubit/cubit_logic.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance; // service locator

Future<void> init() async {
  // ----------------------------
  // Dio (from DioFactory)
  // ----------------------------
  final dio = await DioFactory.createDio();

  // ----------------------------
  // Remote DataSource (Retrofit)
  // ----------------------------
  final appServiceClient = AppServiceClient(dio);
  sl.registerLazySingleton(() => appServiceClient);

  // ----------------------------
  // Repositories
  // ----------------------------
  sl.registerLazySingleton<DomianRepo>(() => RegisterRepositoryImpl(sl()));

  // ----------------------------
  // UseCases
  // ----------------------------
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  // ----------------------------
  // Cubit
  // ----------------------------
  sl.registerFactory(
    () => AuthCubit(sl(), sl()), // inject RegisterUseCase & LoginUsecase
  );
}
