import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruit_e_commerce/core/network/network_info.dart';
import 'package:fruit_e_commerce/features/Auth/data/data_sources/local_data_source/local_data_source.dart';
import 'package:fruit_e_commerce/features/Auth/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:fruit_e_commerce/features/Auth/data/repositories_impl/auth_repository_imp.dart';
import 'package:fruit_e_commerce/features/Auth/domain/repositories/Auth_repository.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/reset_password_usecase.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/save_userdata_usecase.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/send_email_verification_usecase.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/user_login_usecase.dart';
import 'package:fruit_e_commerce/features/Auth/domain/use_cases/user_login_with_email_and_password.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:fruit_e_commerce/features/favourites/data/data_sources/remote_data_source.dart';
import 'package:fruit_e_commerce/features/favourites/data/repositories_impl/favourite_repositories_impl.dart';
import 'package:fruit_e_commerce/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:fruit_e_commerce/features/favourites/domain/use_cases/add_item_to_favourites_use_case.dart';
import 'package:fruit_e_commerce/features/favourites/presentation/bloc/favourites_bloc.dart';
import 'package:fruit_e_commerce/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:fruit_e_commerce/features/home/data/repositories_impl/home_repository_impl.dart';
import 'package:fruit_e_commerce/features/home/domain/repositories/home_repository.dart';
import 'package:fruit_e_commerce/features/home/domain/use_cases/get_all_categories_use_case.dart';
import 'package:fruit_e_commerce/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
//!features - signIn

//Bloc
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => HomeBloc(getAllCategoriesUSeCase: sl(), firebaseMessaging: sl()));
  sl.registerFactory(() => FavouritesBloc(addItemToFavouritesUseCase: sl()));

//UseCases
  sl.registerLazySingleton(() => UserLoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => UserLoginWithEmailAndPasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SendEmailVerificationUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SaveAdditionalUserdataUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetAllCategoriesUSeCase(homeRepository: sl()));
  sl.registerLazySingleton(() => AddItemToFavouritesUseCase(favouriteRepository: sl()));

//Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(homeRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<FavouriteRepository>(() => FavouriteRepositoryImpl(favouriteRemoteDataSource: sl(), networkInfo: sl()));

//DataSource
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(localDataSource: sl(), firestore: sl(), firebaseAuth: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(firestore: sl()));
  sl.registerLazySingleton<FavouriteRemoteDataSource>(() => FavouriteRemoteDataSourceImpl(firebaseFirestore: sl()));
//Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));

//External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // ignore: unused_local_variable
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  sl.registerLazySingleton(() => firebaseMessaging);

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton<FirebaseFirestore>(() => firestore);

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
