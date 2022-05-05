
import 'package:app2/models/shop_app/change_favorites_model.dart';
import 'package:app2/models/shop_app/login_model.dart';

abstract class shopStates{}

class shopInitialState extends shopStates{}

class shopChangeBottomNavlState extends shopStates{}
class shopLoadingHomeDataState extends shopStates{}


class shopSuccessHomeDataState extends shopStates{}
class shopErrorHomeDataState extends shopStates{

  final String error;
  shopErrorHomeDataState({required this.error});
}


class shopSuccessCategoriesState extends shopStates{}
class shopErrorCategoriesState extends shopStates{

  final String error;
  shopErrorCategoriesState({required this.error});
}

class shopChangeFavoritesState extends shopStates{}


class shopSuccessChangeFavoritesState extends shopStates{

    changeFavoritesModel ? model;
  shopSuccessChangeFavoritesState(this.model);
}
class shopErrorChangeFavoritesState extends shopStates{

  final String error;
  shopErrorChangeFavoritesState({required this.error});
}


class shopLoadingGetFavoritesState extends shopStates{}
class shopSuccessGetFavoritesState extends shopStates{}
class shopErrorGetFavoritesState extends shopStates{

  final String error;
  shopErrorGetFavoritesState({required this.error});
}



class shopLoadingUserDataState extends shopStates{}
class shopSuccessGetUserDataState extends shopStates{
  final shopLoginModel shopLloginmodel;
  shopSuccessGetUserDataState(this.shopLloginmodel);

}
class shopErrorUserDataState extends shopStates{

  final String error;
  shopErrorUserDataState({required this.error});
}











