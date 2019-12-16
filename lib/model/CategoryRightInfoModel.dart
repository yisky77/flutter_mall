class CategoryRightInfoModel {
  int errno;
  Data data;
  String errmsg;

  CategoryRightInfoModel({this.errno, this.data, this.errmsg});

  CategoryRightInfoModel.fromJson(Map<String, dynamic> json) {
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
  List<CurrentSubCategory> currentSubCategory;

  Data({this.currentSubCategory});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['currentSubCategory'] != null) {
      currentSubCategory = new List<CurrentSubCategory>();
      json['currentSubCategory'].forEach((v) {
        currentSubCategory.add(new CurrentSubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentSubCategory != null) {
      data['currentSubCategory'] =
          this.currentSubCategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentSubCategory {
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

  CurrentSubCategory(
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

  CurrentSubCategory.fromJson(Map<String, dynamic> json) {
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
