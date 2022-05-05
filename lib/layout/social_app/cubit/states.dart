abstract class socialStates {}

class socialInitialState extends socialStates{}

class socialGetUserLoadingState extends socialStates{}
class socialGetUserSuccessState extends socialStates{}
class socialGetUserErrorState extends socialStates{
  final String error;
  socialGetUserErrorState(this.error);
}


class socialChangeBottomNavState extends socialStates{}

class socialNewsPostState extends socialStates{}

class socialProfileImPickedSuccessState extends socialStates{}
class socialProfileImPickedErrorState extends socialStates{}

class socialCoverImPickedSuccessState extends socialStates{}
class socialCoverImPickedErrorState extends socialStates{}


class socialUploadProfileImErrorState extends socialStates{}
class socialUploadCoverImSuccessState extends socialStates{}


class socialUploadProfileImSuccessState extends socialStates{}
class socialUploadCoverImErrorState extends socialStates{}


class socialUserUpdateErrorState extends socialStates{}
class socialUserUpdateLoadingState extends socialStates{}


class socialCreatePostLoadingState extends socialStates{}
class socialCreatePostSuccessState extends socialStates{}
class socialCreatePostErrorState extends socialStates{}


class socialPostImPickedSuccessState extends socialStates{}
class socialPostImPickedErrorState extends socialStates{}

class socialRemovePostImageState extends socialStates{}


class socialGetPostsLoadingState extends socialStates{}
class socialGetPostsSuccessState extends socialStates{}
class socialGetPostsErrorState extends socialStates{
  final String error;
  socialGetPostsErrorState(this.error);
}

class socialLikePostsSuccessState extends socialStates{}
class socialLikePostsErrorState extends socialStates{
  final String error;
  socialLikePostsErrorState(this.error);
}

class socialCommentPostsLoadingState extends socialStates{}
class socialCommentPostsSuccessState extends socialStates{}
class socialCommentPostsErrorState extends socialStates{
  final String error;
  socialCommentPostsErrorState(this.error);
}



class socialGetAllUserLoadingState extends socialStates{}
class socialGetAllUserSuccessState extends socialStates{}
class socialGetAllUserErrorState extends socialStates{
  final String error;
  socialGetAllUserErrorState(this.error);
}



class socialSendMessageSuccessState extends socialStates{}
class socialSendMessageErrorState extends socialStates{
  final String error;
  socialSendMessageErrorState(this.error);
}


class socialGetMessageSuccessState extends socialStates{}



class socialCreateMessageLoadingState extends socialStates{}
class socialCreateMessageSuccessState extends socialStates{}
class socialCreateMessageErrorState extends socialStates{}













