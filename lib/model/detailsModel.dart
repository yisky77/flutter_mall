class DetailsModel {
  int code;
  DetailsModelData data;
  String status;

  DetailsModel({this.code, this.data, this.status});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new DetailsModelData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class DetailsModelData {
  int current;
  int pages;
  List<Records> records;
  int size;
  int total;

  DetailsModelData({this.current, this.pages, this.records, this.size, this.total});

  DetailsModelData.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    pages = json['pages'];
    if (json['records'] != null) {
      records = new List<Records>();
      json['records'].forEach((v) {
        records.add(new Records.fromJson(v));
      });
    }
    size = json['size'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['pages'] = this.pages;
    if (this.records != null) {
      data['records'] = this.records.map((v) => v.toJson()).toList();
    }
    data['size'] = this.size;
    data['total'] = this.total;
    return data;
  }
}

class Records {
  String adImage;
  int adStatus;
  String companyBrief;
  String companyContent;
  String companyName;
  String createTime;
  String dueDate;
  bool follow;
  String followNumber;
  String id;
  String image;
  int isBanner;
  int isHot;
  int isRecommend;
  int isTop;
  int isVideo;
  int isVideoIndex;
  int isVideoRecommend;
  String labelIds;
  String labelNames;
  String logo;
  String qrcode;
  int sort;
  int status;
  String url;
  String videoAddress;
  String videoImage;
  String wechatQrcode;
  String wordGroup;

  Records(
      {this.adImage,
        this.adStatus,
        this.companyBrief,
        this.companyContent,
        this.companyName,
        this.createTime,
        this.dueDate,
        this.follow,
        this.followNumber,
        this.id,
        this.image,
        this.isBanner,
        this.isHot,
        this.isRecommend,
        this.isTop,
        this.isVideo,
        this.isVideoIndex,
        this.isVideoRecommend,
        this.labelIds,
        this.labelNames,
        this.logo,
        this.qrcode,
        this.sort,
        this.status,
        this.url,
        this.videoAddress,
        this.videoImage,
        this.wechatQrcode,
        this.wordGroup});

  Records.fromJson(Map<String, dynamic> json) {
    adImage = json['adImage'];
    adStatus = json['adStatus'];
    companyBrief = json['companyBrief'];
    companyContent = json['companyContent'];
    companyName = json['companyName'];
    createTime = json['createTime'];
    dueDate = json['dueDate'];
    follow = json['follow'];
    followNumber = json['followNumber'];
    id = json['id'];
    image = json['image'];
    isBanner = json['isBanner'];
    isHot = json['isHot'];
    isRecommend = json['isRecommend'];
    isTop = json['isTop'];
    isVideo = json['isVideo'];
    isVideoIndex = json['isVideoIndex'];
    isVideoRecommend = json['isVideoRecommend'];
    labelIds = json['labelIds'];
    labelNames = json['labelNames'];
    logo = json['logo'];
    qrcode = json['qrcode'];
    sort = json['sort'];
    status = json['status'];
    url = json['url'];
    videoAddress = json['videoAddress'];
    videoImage = json['videoImage'];
    wechatQrcode = json['wechatQrcode'];
    wordGroup = json['wordGroup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adImage'] = this.adImage;
    data['adStatus'] = this.adStatus;
    data['companyBrief'] = this.companyBrief;
    data['companyContent'] = this.companyContent;
    data['companyName'] = this.companyName;
    data['createTime'] = this.createTime;
    data['dueDate'] = this.dueDate;
    data['follow'] = this.follow;
    data['followNumber'] = this.followNumber;
    data['id'] = this.id;
    data['image'] = this.image;
    data['isBanner'] = this.isBanner;
    data['isHot'] = this.isHot;
    data['isRecommend'] = this.isRecommend;
    data['isTop'] = this.isTop;
    data['isVideo'] = this.isVideo;
    data['isVideoIndex'] = this.isVideoIndex;
    data['isVideoRecommend'] = this.isVideoRecommend;
    data['labelIds'] = this.labelIds;
    data['labelNames'] = this.labelNames;
    data['logo'] = this.logo;
    data['qrcode'] = this.qrcode;
    data['sort'] = this.sort;
    data['status'] = this.status;
    data['url'] = this.url;
    data['videoAddress'] = this.videoAddress;
    data['videoImage'] = this.videoImage;
    data['wechatQrcode'] = this.wechatQrcode;
    data['wordGroup'] = this.wordGroup;
    return data;
  }
}
