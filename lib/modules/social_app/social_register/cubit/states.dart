
abstract class socialRegisterState{}

class socialRegisterInitialState extends socialRegisterState{}
class socialRegisterLoadingState extends socialRegisterState{}
class socialRegisterSuccessState extends socialRegisterState {}
class socialRegisterErrorState extends socialRegisterState{

  final String error;
  socialRegisterErrorState(this.error){
    print(error);
  }
}

class showRegisterpasswordState extends socialRegisterState{}

class socialCreateUserSuccessState extends socialRegisterState {
  final String uId;

  socialCreateUserSuccessState(this.uId);

}


class socialCreateUserErrorState extends socialRegisterState{

  final String error;
  socialCreateUserErrorState(this.error){
    print(error);
  }
}










