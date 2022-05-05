import 'package:app2/models/shop_app/login_model.dart';

abstract class shopLoginState{}

class shopLoginInitialState extends shopLoginState{}
class shopLoginLoadingState extends shopLoginState{}

class shopLoginSuccessState extends shopLoginState
{
  final shopLoginModel loginmodel;
  shopLoginSuccessState(this.loginmodel);
}

class shopLoginErrorState extends shopLoginState{

  final String error;
  shopLoginErrorState(this.error){
    print(error);
  }
}


class showpasswordState extends shopLoginState{}













