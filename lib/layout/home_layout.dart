
import 'package:app2/modules/todo_app/archived_tasks/archived_tasks.dart';
import 'package:app2/modules/todo_app/done_tasks/done_tasks.dart';
import 'package:app2/modules/todo_app/new_tasks/new_tasks.dart';
import 'package:app2/shared/components/components.dart';
import 'package:app2/shared/components/constants.dart';
import 'package:app2/shared/cubit/cubit.dart';
import 'package:app2/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class Homelayout extends StatelessWidget {


  var titlecontroller=TextEditingController();
  var datecontroller=TextEditingController();
  var timecontroller=TextEditingController();

  var scaffoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();


  Color iconcolor=Colors.red;

  @override

  @override
  Widget build(BuildContext context) {

    return BlocProvider(

        create:(context) => appcubit()..createDatabase() ,

        child: BlocConsumer<appcubit,appstates>(

        listener: (context, state) => (){

          if(state is appchangeInsertIntoDatabase)
            {
             // Navigator.pop(context);
            }
        } ,

        builder: (context, state) {

        appcubit cubit= appcubit.get(context);

        return Scaffold(

        key: scaffoldkey,
        appBar: AppBar(
          title: Text( cubit.title[cubit.currenindex]),
          leading:Icon(Icons.menu),
        ),

        body:state is appGetDatabaseLoadingstate? Center(child: CircularProgressIndicator()) : cubit.screen[cubit.currenindex],

        floatingActionButton: FloatingActionButton(

          child: cubit.floatingbuttonicon,
          onPressed: () async {

            // insertIntoDatabase();
            /*  setState(() {
            iconcolor=Colors.black;
          });*/  ///****************setstate****************

            if(cubit.isbottomsheetshown)
            {
              if(formkey.currentState!.validate())
              {
                cubit.insertIntoDatabase(title: titlecontroller.text, date: datecontroller.text, time: timecontroller.text,context: context);

                /*
                insertIntoDatabase(
                  title:titlecontroller.text ,
                  time:timecontroller.text ,
                  date:datecontroller.text ,
                ).then((value) {
                  Navigator.pop(context);
                  floatingbuttonicon = Icon(Icons.edit);
                  isbottomsheetshown = false;
                });
*/
              }
            }
            else
            {
             // floatingbuttonicon=Icon(Icons.add);
              //isbottomsheetshown=true;
              cubit.changebottomsheet( true,Icon(Icons.add));

              scaffoldkey.currentState!.showBottomSheet((context)
              {
                return Form(
                  key: formkey,
                  child: Container(
                    color: Colors.grey[100],
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultFormField(onsubmit: (){},
                          validatointext: "title can no be empty",
                          showpasswordicon: (){},
                          onchanged: (){},
                          controller: titlecontroller,
                          type: TextInputType.text,
                          labeltext: 'Task Title',
                          prefix: Icons.title,
                          ontap: (){

                          },
                        ),
                        SizedBox(height: 15.0,),
                        defaultFormField(onsubmit: (){},
                          //isenabled: false,
                          validatointext: "title can no be empty",
                          showpasswordicon: (){},
                          onchanged: (){},
                          controller: timecontroller,
                          type: TextInputType.datetime,
                          labeltext: 'Task Time',
                          prefix: Icons.watch_later_outlined,
                          ontap: (){
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              timecontroller.text=value!.format(context).toString();
                            });
                          },
                        ),
                        SizedBox(height: 15.0,),
                        defaultFormField(onsubmit: (){},
                          //  isenabled: false,
                          validatointext: "Date can no be empty",
                          showpasswordicon: (){},
                          onchanged: (){},
                          controller: datecontroller,
                          type: TextInputType.datetime,
                          labeltext: 'Date',
                          prefix: Icons.calendar_today,
                          ontap: (){
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now() ,
                              lastDate: DateTime.parse('2023-10-05'),
                            ).then((value)
                            {

                              datecontroller.text=DateFormat.yMMMd().format(value!);
                            });
                          },
                        ),


                      ],
                    ),
                  ),
                );
              }).closed.then((value) {
                cubit.changebottomsheet( false,Icon(Icons.edit));
              });
            }
            /// *****************************************************
          },

          splashColor: iconcolor,
          tooltip: 'add',
          backgroundColor: Colors.blue,
        ),

        bottomNavigationBar: BottomNavigationBar(

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu_outlined),label: 'Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline),label: 'Done'),
            BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),label: 'Archived'),
          ],

          onTap: (index)
          {
            cubit.changeindex(index);
            /* setState(() {
            currenindex=index;
          });*/ ///****************setstate****************
          },
          currentIndex:  cubit.currenindex,
        ),


      );}
      ),
    );
  }
  //Center(child: CircularProgressIndicator())

 // cubit.screen[cubit.currenindex]



}
