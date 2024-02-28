import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/network/connection/bloc/connection_bloc.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/features/Auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:fruit_e_commerce/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:fruit_e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:fruit_e_commerce/bloc_observer.dart';
import 'package:fruit_e_commerce/core/utils/app_theme.dart' as themes;
import 'package:fruit_e_commerce/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:fruit_e_commerce/injectionContainer.dart' as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final bool isLoggedIn;
  await di.init();

  
  if (FirebaseAuth.instance.currentUser != null) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }

  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);
  
  final bool isLoggedIn;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor, // Set your desired status bar color here
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<HomeBloc>()..add(GetAllCategoriesEvent())),
        BlocProvider(create: (context) => ConnectionBloc()),
        BlocProvider(create: (context) => di.sl<AuthBloc>())
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themes.appTheme,
              home:isLoggedIn? const HomePage():SplashScreenPage(isLoggedIn: isLoggedIn) 
              )),
    );
  }
}
