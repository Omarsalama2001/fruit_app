import 'package:fruit_e_commerce/features/Auth/data/data_sources/local_data_source/local_data_source.dart';
import 'package:fruit_e_commerce/features/Auth/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:fruit_e_commerce/features/Auth/data/repositories_impl/auth_repository_imp.dart';
import 'package:fruit_e_commerce/features/Auth/domain/repositories/Auth_repository.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/user_login_usecase.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
//!features - signIn

//Bloc
  sl.registerFactory(() => AuthBloc(sl()));

//UseCases
  sl.registerLazySingleton(() => UserLoginUseCase(authRepository: sl()));
//Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: sl()));

//DataSource
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(localDataSource: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sharedPreferences: sl()));
//Core

//External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
