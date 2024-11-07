import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/observe.dart';
import 'package:news_app/shared/cubit/state.dart';
import 'package:news_app/shared/network/cache_helper.dart';
import 'package:news_app/shared/network/dio_helper.dart';

import 'layout/home.dart';
import 'layout/layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark ?? false));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..checkDarkMode(fromShared: isDark)
        ..getDataForBusiness()
        ..getDataForScience()
        ..getDataForSport()
      ..getDataForHealth()
      ..getDataForEntertainment()
      ..getDataForTechnology(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, AppStates state) {},
          builder: (context, AppStates state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Colors.pink,
                primarySwatch: Colors.pink,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 15.0,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.pink[800]),
                iconTheme: IconThemeData(color: Colors.black),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    titleTextStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.pink[800],
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        systemNavigationBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark)),
                textTheme: TextTheme(
                    bodySmall: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    bodyMedium: TextStyle(color: Colors.black, fontSize: 15)),
                colorScheme:
                    ColorScheme.fromSeed(seedColor: Colors.pink.shade800),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(

                hintColor: Colors.white,
                primaryIconTheme: IconThemeData(color: Colors.white, size: 25),
                iconButtonTheme: IconButtonThemeData(style: ButtonStyle()),
                primaryColor: Colors.pink,
                primarySwatch: Colors.pink,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 15.0,
                    unselectedItemColor: Colors.white70,
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.pink),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(color: Colors.white70),
                    backgroundColor: Colors.black,
                    surfaceTintColor: Colors.black,
                    titleTextStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.pink,
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.black,
                        systemNavigationBarColor: Colors.black,
                        statusBarIconBrightness: Brightness.light)),
                textTheme: TextTheme(
                    bodySmall: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    bodyMedium: TextStyle(color: Colors.white, fontSize: 15)),
                colorScheme:
                    ColorScheme.fromSeed(seedColor: Colors.pink),
                useMaterial3: true,
              ),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: HomeScreen(),
            );
          }),
    );
  }
}
