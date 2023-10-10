import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/app_colors.dart';
import 'package:fruit_e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fruit_e_commerce/bloc_observer.dart';
import 'package:fruit_e_commerce/core/app_theme.dart' as themes;
import 'package:fruit_e_commerce/core/constants/cache_keys.dart';
import 'package:fruit_e_commerce/injectionContainer.dart' as di;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool isLoggedIn;
  await di.init();
  String? token = di.sl<SharedPreferences>().getString(TOKENID_KEY);
  if (token != null) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return ScreenUtilInit(designSize: const Size(360, 690), minTextAdapt: true, splitScreenMode: true, child: MaterialApp(debugShowCheckedModeBanner: false, theme: themes.appTheme, home: HomePage()));
  }
}
