abstract class AppStates {}

class InitialAppState extends AppStates {}

class ChangeBottomNavBarState extends AppStates {}

class BusinessLoadingState extends AppStates {}

class BusinessSuccessState extends AppStates {}

class BusinessErrorState extends AppStates {
  final String error;

  BusinessErrorState({required this.error});
}

class ScienceLoadingState extends AppStates {}

class ScienceSuccessState extends AppStates {}

class ScienceErrorState extends AppStates {
  final String error;

  ScienceErrorState({required this.error});
}

class SportingLoadingState extends AppStates {}

class SportingSuccessState extends AppStates {}

class SportingErrorState extends AppStates {
  final String error;

  SportingErrorState({required this.error});
}

class SearchLoadingState extends AppStates {}

class SearchSuccessState extends AppStates {}

class SearchErrorState extends AppStates {
  final String error;

  SearchErrorState({required this.error});
}


class HealthLoadingState extends AppStates {}

class HealthSuccessState extends AppStates {}

class HealthErrorState extends AppStates {
  final String error;
  HealthErrorState({required this.error});
}


class TechnologyLoadingState extends AppStates {}

class TechnologySuccessState extends AppStates {}

class TechnologyErrorState extends AppStates {
  final String error;

  TechnologyErrorState({required this.error});
}


class EntertainmentLoadingState extends AppStates {}

class EntertainmentSuccessState extends AppStates {}

class EntertainmentErrorState extends AppStates {
  final String error;

  EntertainmentErrorState({required this.error});
}
class  CheckDarkMode extends AppStates{}