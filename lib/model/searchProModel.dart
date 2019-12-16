class SearchProModel {
  int errno;
  Data data;
  String errmsg;

  SearchProModel({this.errno, this.data, this.errmsg});

  SearchProModel.fromJson(Map<String, dynamic> json) {
    errno = json['errno'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errmsg = json['errmsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errno'] = this.errno;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['errmsg'] = this.errmsg;
    return data;
  }
}

class Data {
  int total;
  int pages;
  int limit;
  int page;
  List<Lists> list;
  List<FilterCategoryList> filterCategoryList;

  Data(
      {this.total,
        this.pages,
        this.limit,
        this.page,
        this.list,
        this.filterCategoryList});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pages = json['pages'];
    limit = json['limit'];
    page = json['page'];
    if (json['list'] != null) {
      list = new List<Lists>();
      json['list'].forEach((v) {
        list.add(new Lists.fromJson(v));
      });
    }
    if (json['filterCategoryList'] != null) {
      filterCategoryList = new List<FilterCategoryList>();
      json['filterCategoryList'].forEach((v) {
        filterCategoryList.add(new FilterCategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pages'] = this.pages;
    data['limit'] = this.limit;
    data['page'] = this.page;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    if (this.filterCategoryList != null) {
      data['filterCategoryList'] =
          this.filterCategoryList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  int id;
  String name;
  String brief;
  String picUrl;
  bool isNew;
  bool isHot;
  int counterPrice;
  double retailPrice;

  Lists(
      {this.id,
        this.name,
        this.brief,
        this.picUrl,
        this.isNew,
        this.isHot,
        this.counterPrice,
        this.retailPrice});

  Lists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brief = json['brief'];
    picUrl = json['picUrl'];
    isNew = json['isNew'];
    isHot = json['isHot'];
    counterPrice = json['counterPrice'];
    retailPrice = json['retailPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['brief'] = this.brief;
    data['picUrl'] = this.picUrl;
    data['isNew'] = this.isNew;
    data['isHot'] = this.isHot;
    data['counterPrice'] = this.counterPrice;
    data['retailPrice'] = this.retailPrice;
    return data;
  }
}

class FilterCategoryList {
  int id;
  String name;
  String keywords;
  String desc;
  int pid;
  String iconUrl;
  String picUrl;
  String level;
  int sortOrder;
  String addTime;
  String updateTime;
  bool deleted;

  FilterCategoryList(
      {this.id,
        this.name,
        this.keywords,
        this.desc,
        this.pid,
        this.iconUrl,
        this.picUrl,
        this.level,
        this.sortOrder,
        this.addTime,
        this.updateTime,
        this.deleted});

  FilterCategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    keywords = json['keywords'];
    desc = json['desc'];
    pid = json['pid'];
    iconUrl = json['iconUrl'];
    picUrl = json['picUrl'];
    level = json['level'];
    sortOrder = json['sortOrder'];
    addTime = json['addTime'];
    updateTime = json['updateTime'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['keywords'] = this.keywords;
    data['desc'] = this.desc;
    data['pid'] = this.pid;
    data['iconUrl'] = this.iconUrl;
    data['picUrl'] = this.picUrl;
    data['level'] = this.level;
    data['sortOrder'] = this.sortOrder;
    data['addTime'] = this.addTime;
    data['updateTime'] = this.updateTime;
    data['deleted'] = this.deleted;
    return data;
  }
}
