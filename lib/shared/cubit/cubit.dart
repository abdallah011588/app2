import 'package:app2/layout/news_app/states.dart';

import 'package:app2/shared/cubit/states.dart';
import 'package:app2/shared/network/local/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/todo_app/archived_tasks/archived_tasks.dart';
import '../../modules/todo_app/done_tasks/done_tasks.dart';
import '../../modules/todo_app/new_tasks/new_tasks.dart';

class appcubit extends Cubit<appstates>
{


  appcubit():super(appinitialstate());

  List<Map> newtasks=[];
  List<Map> donetasks=[];
  List<Map> archivedtasks=[];

  late Database database;


  int currenindex=0;
  List<Widget> screen=
  [
    Newtasks(),
    Donetasks(),
    Archivedtasks()
  ];

  List<String> title=
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];


  Icon floatingbuttonicon=Icon(Icons.add);
  bool isbottomsheetshown=false;

  static appcubit get(context)=>BlocProvider.of(context);


  void changeindex(int index)
  {
    currenindex=index;
    emit(appchangBottonNavBarstate());
  }


void changebottomsheet(
    @required bool isShow,
    @required Icon icon,) {
   floatingbuttonicon=icon;
   isbottomsheetshown=isShow;

   emit(appchangeShowBottomsheet());
}




void updateDatabase({
    required int id,
    required String status,
})
{
  database.rawUpdate('UPDATE tasks SET status=? WHERE id=?',['$status',id]).then((value)
  {
    getFromDatabase(database);
    emit(appUpdateDatabasestate());

  });
}


  void createDatabase()
  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time Text,status TEXT)'
        ).then((value) {
          print('database created');
        }).catchError((error){
          print(' error on created database ${error.toString()}');
        });
      },

        onOpen: (database){
        getFromDatabase(database);
      },

    ).then((value) {
       database=value;
       emit(appchangeCreateDatabase());
     });
  }


   insertIntoDatabase({
    required String title,
    required String date,
    required String time,
     required BuildContext context,
  })async {

    await database.transaction( (txn)
    {
      return txn.rawInsert(
          'INSERT INTO tasks(title ,date,time ,status) VALUES("$title","$date","$time","New")'
      ).then( (value){
        //print('${value} inserted into database');
        emit(appchangeInsertIntoDatabase());
        Navigator.pop(context);
        getFromDatabase(database);
      }).catchError((error){
        print('${error} inserted into database');
      });
      // return null;
    }
    );
  }

   void getFromDatabase(database)
  {
    newtasks=[];
    donetasks=[];
    archivedtasks=[];

    emit(appGetDatabaseLoadingstate());
    database.rawQuery('SELECT * FROM tasks').then((value){

    value.forEach( (item){

      if(item['status']=='New') newtasks.add(item);
      else if(item['status']=='Done') donetasks.add(item);
      else archivedtasks.add(item);
    });
        /*
    print(newtasks);
    print('****************************************');
    print(donetasks);
    print('****************************************');
    print(archivedtasks);
*/
      emit(appchangeGetfromDatabase());
    }); ;
    //print(tasks);
  }


  void deleteFromDatabase({required int id})
  {
    database.rawDelete('DELETE FROM tasks WHERE id=?',[id]).then((value) {

      getFromDatabase(database);
      emit(appDeleteDatabasestate());
    });
  }





  bool isdark=false;

  void changeappMode({bool? fromShared})
  {
    if(fromShared !=null) {
      isdark = fromShared;
      emit(newsIsDarkModeState());
    }
    else
    {
      isdark = !isdark;
      CacheHelper.putBoolean(key: 'isDark', value: isdark).then((value) {
        emit(newsIsDarkModeState());
      });
    }
  }






}