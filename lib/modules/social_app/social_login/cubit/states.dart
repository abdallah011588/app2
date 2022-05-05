
abstract class socialLoginState{}

class socialLoginInitialState extends socialLoginState{}
class socialLoginLoadingState extends socialLoginState{}
class socialLoginSuccessState extends socialLoginState {
  final String uId;
  socialLoginSuccessState(this.uId);
}

class socialLoginErrorState extends socialLoginState{

  final String error;
  socialLoginErrorState(this.error){
    print(error);
  }
}

class showpasswordState extends socialLoginState{}













