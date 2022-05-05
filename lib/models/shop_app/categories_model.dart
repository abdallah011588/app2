
import 'dart:convert';

class categoriesModel
{
   bool ? status;
   categoriesDataModel ? data;

  categoriesModel.fromJson(Map <String ,dynamic> json)
  {
    status=json['status'];
    data= categoriesDataModel.fromJson (json['data']);
  }

}



class categoriesDataModel
{
   int ? currentPage;
   List<dataModel> ? data=[];

  categoriesDataModel.fromJson(Map <String ,dynamic> json)
  {
   currentPage=json['current-page'];
   json['data'].forEach((element)
   {
      data?.add(dataModel.fromJson(element));
   });
  }
}



class dataModel
{
   int ? id;
   String ? name;
   String ? image;

  dataModel.fromJson(Map <String ,dynamic> data)
  {
    id=data['id'];
    name=data['name'];
    image=data['image'];
  }

}






