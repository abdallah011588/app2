
class favoritesModel
{
  late bool  status;
  late Data  data;

  favoritesModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }
}

class Data {
  late  int currentPage;
  late List<FavoritesData>  data;
  late String  firstPageUrl;
  late int from;
  late int lastPage;
  late String lastPageUrl;
  late String nextPageUrl;
  late  String path;
  late int perPage;
  late   String prevPageUrl;
  late   int to;
  late   int  total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <FavoritesData>[];
      json['data'].forEach((v) {
        data.add(new FavoritesData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class FavoritesData {
  late  int  id;
  late  Product product;

  FavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    (json['product'] != null ? new Product.fromJson(json['product']) : null)!;
  }
}

class Product {
  late  int id;
  late  dynamic price;
  late dynamic oldPrice;
  late  int discount;
  late  String image;
  late String  name;
  late String  description;

  Product(
      {
        required this.id,
        required this.price,
        required this.oldPrice,
        required  this.discount,
        required  this.image,
        required  this.name,
        required  this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

/// *********************************************

/*
class AutoGenerate {
  AutoGenerate({
    required this.status,
    this.message,
    required this.data,
  });
  late final bool status;
  late final Null message;
  late final Data data;

  AutoGenerate.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = null;
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}
class Data {
  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    this.to,
    required this.total,
  });
  late final int currentPage;
  late final List<dynamic> data;
  late final String firstPageUrl;
  late final Null from;
  late final int lastPage;
  late final String lastPageUrl;
  late final Null nextPageUrl;
  late final String path;
  late final int perPage;
  late final Null prevPageUrl;
  late final Null to;
  late final int total;

  Data.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
    firstPageUrl = json['first_page_url'];
    from = null;
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = null;
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = null;
    to = null;
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['data'] = data;
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['last_page_url'] = lastPageUrl;
    _data['next_page_url'] = nextPageUrl;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['prev_page_url'] = prevPageUrl;
    _data['to'] = to;
    _data['total'] = total;
    return _data;
  }
}
 */