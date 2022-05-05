
abstract class newStates{}
class newsInitialState extends newStates{}
class bottomNavState extends newStates{}

class newsGetBusinessSuccessState extends newStates{}
class newsGetSportsSuccessState extends newStates{}
class newsGetScienceSuccessState extends newStates{}

class newsLoadingState extends newStates{}

class newsGetBusinessErrorState extends newStates{

  final String error;

  newsGetBusinessErrorState(this.error);
}
class newsGetSportsErrorState extends newStates{

  final String error;

  newsGetSportsErrorState(this.error);
}
class newsGetScienceErrorState extends newStates{

  final String error;

  newsGetScienceErrorState(this.error);
}


//////search
class newsGetsearchSuccessState extends newStates{}
class newsGetsearchErrorState extends newStates{

  final String error;

  newsGetsearchErrorState(this.error);
}
