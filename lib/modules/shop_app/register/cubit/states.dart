import 'package:app2/models/shop_app/login_model.dart';

abstract class shopRegisterState{}

class shopRegisterInitialState extends shopRegisterState{}
class shopRegisterLoadingState extends shopRegisterState{}

class shopRegisterSuccessState extends shopRegisterState
{
  final shopLoginModel loginmodel;
  shopRegisterSuccessState(this.loginmodel);
}

class shopRegisterErrorState extends shopRegisterState{

  final String error;
  shopRegisterErrorState(this.error){
    print(error);
  }
}


class showRegisterpasswordState extends shopRegisterState{}













