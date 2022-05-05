import 'package:app2/modules/shop_app/login/shop_login_screen.dart';
import 'package:app2/shared/network/local/cache_helper.dart';
import 'package:app2/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class boardingModel
{
  final String image,title,body;

  boardingModel({
    required this.image,
    required this.title,
    required this.body,
});
}

class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen>
{

  List<boardingModel> boarding=
  [
    boardingModel(image: 'assets/images/shop6.jpg', title: 'on Board 1 title', body: 'on bord 1 body'),
    boardingModel(image: 'assets/images/shop2.jpg', title: 'on Board 2 title', body: 'on bord 2 body'),
    boardingModel(image: 'assets/images/shop8.jpg', title: 'on Board 3 title', body: 'on bord 3 body'),
  ];

  var pageViewController=PageController();

  bool islast=false;

  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value){
      if(value)
        {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => shopLoginScreen(),),
                (route) => false,
          );
        }
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:AppBar(
          actions: [
            TextButton(
              onPressed: (){
                submit();
               /* Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => shopLoginScreen(),),
                      (route) => false,
                );*/
              },
              child: Text('Skip'),
            ),          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                    itemBuilder: (context, index) => buildPageviewItem(boarding[index]),
                    physics: BouncingScrollPhysics(),
                    itemCount: boarding.length,
                    controller:pageViewController ,
                    onPageChanged: (int index){
                      if(index==boarding.length-1) {
                          setState(() {
                            islast=true;
                          });
                        }
                      else{
                        setState(() {
                          islast=false;
                        });
                      }
                    },

                  )
              ),
              SizedBox(height:40.0),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: pageViewController,
                      count: boarding.length,
                      effect:ExpandingDotsEffect(
                        activeDotColor: defaultColor,
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: (){
                      if(islast)
                        {
                          submit();
                          /*Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => shopLoginScreen(),),
                             (route) => false,
                          );

                           */
                        }
                      else{
                          pageViewController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                  child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
          ),
        ),

    );
  }

  Widget buildPageviewItem(boardingModel boarding)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(image: AssetImage('${boarding.image}'),
        ),
      ),
      Text(
        '${boarding.title}',
        style:TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 15.0,),
      Text(
        '${boarding.body}',
        style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 15.0,),
    ],
  );
}
