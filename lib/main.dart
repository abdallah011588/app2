import 'package:app2/layout/shop_app/cubit/cubit.dart';
import 'package:app2/layout/shop_app/shop_layout.dart';
import 'package:app2/layout/social_app/cubit/cubit.dart';
import 'package:app2/layout/social_app/social_layout.dart';
import 'package:app2/modules/bmi_app/bmi/BMIScreen.dart';
import 'package:app2/modules/native_code.dart';
import 'package:app2/modules/shop_app/login/shop_login_screen.dart';
import 'package:app2/modules/shop_app/on_boarding/onboarding_screen.dart';
import 'package:app2/modules/social_app/social_login/social_loginscrren.dart';
import 'package:app2/modules/social_app/social_register/social_register_screen.dart';
import 'package:app2/shared/bloc_observer.dart';
import 'package:app2/shared/components/constants.dart';
import 'package:app2/shared/cubit/cubit.dart';
import 'package:app2/shared/cubit/states.dart';
import 'package:app2/shared/network/local/cache_helper.dart';
import 'package:app2/shared/network/remote/dio_helper.dart';
import 'package:app2/shared/styles/themes.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'layout/home_layout.dart';
import 'layout/news_app/cubit.dart';
import 'layout/news_app/news_layout.dart';
//import 'modules/bmi/BMIScreen.dart';
//import 'modules/health/Health.dart';
import 'modules/mybmi/MyBMIScreen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:io';
import 'modules/news_app/web_view/web_view.dart';



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async
{

  Fluttertoast.showToast(msg:'Background Message',
    textColor: Colors.white,
    backgroundColor: Colors.green,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 5,
  );

  print("background message: ${message.data.toString()}");
}


void main() async
{
  /// To ENSURE THAT ALL THINGS UN THE METHOD IS FINISHED THEN OPEN THE APP **RUNAPP**
  WidgetsFlutterBinding.ensureInitialized();
  /// /////////////////////////////////////////////////////////////////////////////***

  //if(Platform.isWindows)
  //await DesktopWindow.setMinWindowSize(Size(500,600));

  //testWindowFunctions();

  // await Firebase.initializeApp();
  //
  // var deviceToken= await FirebaseMessaging.instance.getToken();
  // print('start '+deviceToken.toString()+' end');
  //
  // FirebaseMessaging.onMessage.listen((event) {
  //   print(event.data.toString());
  //
  //   Fluttertoast.showToast(msg:'On Message',
  //     textColor: Colors.white,
  //     backgroundColor: Colors.green,
  //     gravity: ToastGravity.BOTTOM,
  //     toastLength: Toast.LENGTH_LONG,
  //     timeInSecForIosWeb: 5,
  //   );
  // });
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print(event.data.toString());
  //
  //   Fluttertoast.showToast(msg:'On Message Opened App',
  //     textColor: Colors.white,
  //     backgroundColor: Colors.green,
  //     gravity: ToastGravity.BOTTOM,
  //     toastLength: Toast.LENGTH_LONG,
  //     timeInSecForIosWeb: 5,
  //   );
  // });
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  HttpOverrides.global = new MyHttpOverrides();
  await CacheHelper.init();
  dioHelper.init();

  bool isdark=CacheHelper.getBoolean(key: 'isDark')==null? false:CacheHelper.getBoolean(key: 'isDark');
  bool onBoarding= CacheHelper.getBoolean(key: 'onBoarding')==null? false : CacheHelper.getBoolean(key: 'onBoarding');
  bool isLogin= CacheHelper.getBoolean(key: 'isLogin')==null? false : CacheHelper.getBoolean(key: 'isLogin');
  bool isLoginInSocialApp= CacheHelper.getBoolean(key: 'isLoginInSocialApp')==null? false : CacheHelper.getBoolean(key: 'isLoginInSocialApp');

  token=CacheHelper.getString(key:'token').toString();
  uId=CacheHelper.getString(key: 'uId').toString();

  runApp( MyApp(isdark:isdark,onBoarding: onBoarding,isLogin: isLogin,isLoginInSocialApp:isLoginInSocialApp));

}

class MyApp extends StatelessWidget
{

   late bool  isdark;
   late bool  onBoarding;
   late bool  isLogin;
   late bool isLoginInSocialApp;


   MyApp({
     required this.isdark,
     required this.onBoarding,
     required this.isLogin,
     required this.isLoginInSocialApp,
} );

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> newsCubit()..getBusiness()..getSports()..getScience()),
        BlocProvider(create:(context) => appcubit()..changeappMode(fromShared: isdark,),),
        BlocProvider(create:(context) => shopCubit()..getHomeData()..getCategoriesData()..getFavorites()..getUserData()),
        BlocProvider(create: (context)=>socialCubit()..getUserData()..getPosts()),
      ],
      child: BlocConsumer<appcubit,appstates>(
        listener: (context, state) => (){},
        builder: (context, state) {
          return  MaterialApp(
            home: Directionality(
                textDirection: TextDirection.ltr,
                child: nativeCodeScreen(),

              /*  ScreenTypeLayout(
                  mobile: NewsLayout(),
                  desktop: Text('Desktop'),
                  tablet:Text('tablet') ,
                  watch: Text('watch'),
                  breakpoints: ScreenBreakpoints(desktop:800 ,tablet:600 ,watch:550 ),
                ),*/
             //isLoginInSocialApp? socialLayout():socialLoginScreen(),
             // onBoarding ? isLogin ? shopLayout(): shopLoginScreen(): onBoardingScreen()
            ),
            theme: lighttheme,
            darkTheme: darktheme,
            themeMode: appcubit.get(context).isdark?ThemeMode.dark:ThemeMode.light,
            debugShowCheckedModeBanner: false,
            /*webView( 'https://st3.depositphotos.com/178
            28278/33150/v/380/depositphotos_331503262-stock-illus
            tration-no-image-vector-symbol-missing.jpg?
            forcejpeg=true')),*/
          );
        },
      ),
    );
  }

}






/*
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details
 */

Future testWindowFunctions() async {
  //Size size = await DesktopWindow.getWindowSize();
 // print(size);
  // await DesktopWindow.setWindowSize(Size(500,500));

  await DesktopWindow.setMinWindowSize(Size(1400,1400));
  // await DesktopWindow.setMaxWindowSize(Size(800,800));

  // await DesktopWindow.resetMaxWindowSize();
  // await DesktopWindow.toggleFullScreen();
  // bool isFullScreen = await DesktopWindow.getFullScreen();
  // await DesktopWindow.setFullScreen(true);
  // await DesktopWindow.setFullScreen(false);
}
