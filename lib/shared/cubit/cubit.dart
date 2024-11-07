import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/search.dart';
import 'package:news_app/shared/cubit/state.dart';
import 'package:news_app/shared/network/cache_helper.dart';
import 'package:news_app/shared/network/dio_helper.dart';

import '../../modules/sport_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
  ];

  List<BottomNavigationBarItem> listBottom = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'SCience'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sport'),
  ];

  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

   List<dynamic> business=[];
  void getDataForBusiness()
  {
    emit(BusinessLoadingState());
     DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '83ea4852e69048729221ba4ee8a922a9'
    }).then((value) {
      business=value.data['articles'];
      print(business);
      emit(BusinessSuccessState());
    }).catchError((error) {
      emit(BusinessErrorState(error: error.toString()));
      print(error.toString());
    });

  }

  List<dynamic> sport=[];
  void getDataForSport()
  {
    emit(SportingLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '83ea4852e69048729221ba4ee8a922a9'
    }).then((value) {
      sport=value.data['articles'];
      print(sport);
      emit(SportingSuccessState());
    }).catchError((error) {
      emit(SportingErrorState(error: error.toString()));
      print(error.toString());
    });

  }

  List<dynamic> health=[];
  void getDataForHealth()
  {
    emit(HealthLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'health',
      'apiKey': '83ea4852e69048729221ba4ee8a922a9'
    }).then((value) {
      health=value.data['articles'];
      print(health);
      emit(HealthSuccessState());
    }).catchError((error) {
      emit(HealthErrorState(error: error.toString()));
      print(error.toString());
    });

  }
  List<dynamic> technology=[];
  void getDataForTechnology()
  {
    emit(TechnologyLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': '83ea4852e69048729221ba4ee8a922a9'
    }).then((value) {
      technology=value.data['articles'];
      print(technology);
      emit(TechnologySuccessState());
    }).catchError((error) {
      emit(TechnologyErrorState(error: error.toString()));
      print(error.toString());
    });

  }
  List<dynamic> entertainment=[];
  void getDataForEntertainment()
  {
    emit(EntertainmentLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': '83ea4852e69048729221ba4ee8a922a9'
    }).then((value) {
      entertainment=value.data['articles'];
      print(entertainment);
      emit(EntertainmentSuccessState());
    }).catchError((error) {
      emit(EntertainmentErrorState(error: error.toString()));
      print(error.toString());
    });

  }



  List<dynamic> science=[];
  void getDataForScience()
  {
    emit(ScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '83ea4852e69048729221ba4ee8a922a9'
    }).then((value) {
      science=value.data['articles'];
      print(science);
      emit(ScienceSuccessState());
    }).catchError((error) {
      emit(ScienceErrorState(error: error.toString()));
      print(error.toString());
    });


  }

  bool isDark=false;

  void checkDarkMode({ bool? fromShared})
  {
    if(fromShared !=null)
    {
      isDark=fromShared;
      emit(CheckDarkMode());

    }else{
      isDark =!isDark;

      CacheHelper.putData(key: 'isDark', value: isDark).then((value)
      {
        emit(CheckDarkMode());

      });
    }



  }

  List <dynamic>search=[];

  void getDataForSearch(value)
  {
    emit(SearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      // 'country': 'eg',
      'q': '$value',
      'apiKey': '83ea4852e69048729221ba4ee8a922a9'
    }).then((value) {
      search=value.data['articles'];
      print(search);
      emit(SearchSuccessState());
    }).catchError((error) {
      emit(SearchErrorState(error: error.toString()));
      print(error.toString());
    });

}}
