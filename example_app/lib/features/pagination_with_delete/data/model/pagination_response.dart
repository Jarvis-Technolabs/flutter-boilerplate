/// success : true
/// message : "PaginationItemData fetched succcessfully"
/// data : [{"lstImageMaster":[],"id":3,"chainID":9,"chainTitle":"","brandTitle":"Banquet Hall","brandDescription":"For all types of occassions","status":true,"isDeleted":false,"createdDate":"2018-12-13T16:56:30.153","createdBy":null,"modifiedDate":"2018-12-21T15:56:49.793","modifiedBy":null,"deletedDate":null,"deletedBy":null,"storeCount":0,"color":"7D4146","brandNumber":"BRN3"},{"lstImageMaster":[],"id":5,"chainID":5,"chainTitle":"","brandTitle":"Highway Food Mall","brandDescription":"Pizza on your way","status":true,"isDeleted":false,"createdDate":"2018-12-13T17:11:38.013","createdBy":null,"modifiedDate":"2018-12-21T15:55:44.667","modifiedBy":null,"deletedDate":null,"deletedBy":null,"storeCount":0,"color":"E3553D","brandNumber":"BRN5"},{"lstImageMaster":[],"id":7,"chainID":8,"chainTitle":"","brandTitle":"Dominoz - Pizza Junction","brandDescription":"On your way","status":true,"isDeleted":false,"createdDate":"2018-12-13T17:22:47.45","createdBy":null,"modifiedDate":"2018-12-26T16:06:32.273","modifiedBy":null,"deletedDate":null,"deletedBy":null,"storeCount":0,"color":"4470F2","brandNumber":"BRN7"},{"lstImageMaster":[],"id":8,"chainID":6,"chainTitle":"","brandTitle":"Pizza Hut - Center Point","brandDescription":"Best Quality Pizza","status":true,"isDeleted":false,"createdDate":"2018-12-14T11:22:21.62","createdBy":null,"modifiedDate":"2018-12-21T15:56:12.247","modifiedBy":null,"deletedDate":null,"deletedBy":null,"storeCount":0,"color":"A92E45","brandNumber":"BRN8"},{"lstImageMaster":[],"id":9,"chainID":9,"chainTitle":"","brandTitle":"Saffron - Highway Food","brandDescription":"Brand Description - Saffron","status":true,"isDeleted":false,"createdDate":"2018-12-14T20:27:47.2","createdBy":null,"modifiedDate":"2018-12-21T15:56:29.597","modifiedBy":null,"deletedDate":null,"deletedBy":null,"storeCount":0,"color":"8F5A64","brandNumber":"BRN9"}]
/// error : null

class PaginationResponse {
  PaginationResponse({List<PaginationItemData>? data}) {
    _data = data;
  }

  PaginationResponse.fromJson(dynamic json) {
    if (json != null) {
      _data = [];
      json.forEach((v) {
        _data?.add(PaginationItemData.fromJson(v));
      });
    }
  }

  List<PaginationItemData>? _data;
  List<PaginationItemData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

class PaginationItemData {
  PaginationItemData({
    List<String>? lstImageMaster,
    int? id,
    int? chainID,
    String? chainTitle,
    String? brandTitle,
    String? brandDescription,
    bool? status,
    bool? isDeleted,
    String? createdDate,
    dynamic createdBy,
    String? modifiedDate,
    dynamic modifiedBy,
    dynamic deletedDate,
    dynamic deletedBy,
    int? storeCount,
    String? color,
    String? brandNumber,
  }) {
    _lstImageMaster = lstImageMaster;
    _id = id;
    _chainID = chainID;
    _chainTitle = chainTitle;
    _brandTitle = brandTitle;
    _brandDescription = brandDescription;
    _status = status;
    _isDeleted = isDeleted;
    _createdDate = createdDate;
    _createdBy = createdBy;
    _modifiedDate = modifiedDate;
    _modifiedBy = modifiedBy;
    _deletedDate = deletedDate;
    _deletedBy = deletedBy;
    _storeCount = storeCount;
    _color = color;
    _brandNumber = brandNumber;
  }

  PaginationItemData.fromJson(dynamic json) {
    // if (json['lstImageMaster'] != null) {
    //   _lstImageMaster = [];
    //   json['lstImageMaster'].forEach((v) {
    //     _lstImageMaster?.add(String.fromJson(v));
    //   });
    // }
    _id = json['id'];
    _chainID = json['chainID'];
    _chainTitle = json['chainTitle'];
    _brandTitle = json['brandTitle'];
    _brandDescription = json['brandDescription'];
    _status = json['status'];
    _isDeleted = json['isDeleted'];
    _createdDate = json['createdDate'];
    _createdBy = json['createdBy'];
    _modifiedDate = json['modifiedDate'];
    _modifiedBy = json['modifiedBy'];
    _deletedDate = json['deletedDate'];
    _deletedBy = json['deletedBy'];
    _storeCount = json['storeCount'];
    _color = json['color'];
    _brandNumber = json['brandNumber'];
  }
  List<dynamic>? _lstImageMaster;
  int? _id;
  int? _chainID;
  String? _chainTitle;
  String? _brandTitle;
  String? _brandDescription;
  bool? _status;
  bool? _isDeleted;
  String? _createdDate;
  dynamic _createdBy;
  String? _modifiedDate;
  dynamic _modifiedBy;
  dynamic _deletedDate;
  dynamic _deletedBy;
  int? _storeCount;
  String? _color;
  String? _brandNumber;

  List<dynamic>? get lstImageMaster => _lstImageMaster;
  int? get id => _id;
  int? get chainID => _chainID;
  String? get chainTitle => _chainTitle;
  String? get brandTitle => _brandTitle;
  String? get brandDescription => _brandDescription;
  bool? get status => _status;
  bool? get isDeleted => _isDeleted;
  String? get createdDate => _createdDate;
  dynamic get createdBy => _createdBy;
  String? get modifiedDate => _modifiedDate;
  dynamic get modifiedBy => _modifiedBy;
  dynamic get deletedDate => _deletedDate;
  dynamic get deletedBy => _deletedBy;
  int? get storeCount => _storeCount;
  String? get color => _color;
  String? get brandNumber => _brandNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_lstImageMaster != null) {
      map['lstImageMaster'] = _lstImageMaster?.map((v) => v.toJson()).toList();
    }
    map['id'] = _id;
    map['chainID'] = _chainID;
    map['chainTitle'] = _chainTitle;
    map['brandTitle'] = _brandTitle;
    map['brandDescription'] = _brandDescription;
    map['status'] = _status;
    map['isDeleted'] = _isDeleted;
    map['createdDate'] = _createdDate;
    map['createdBy'] = _createdBy;
    map['modifiedDate'] = _modifiedDate;
    map['modifiedBy'] = _modifiedBy;
    map['deletedDate'] = _deletedDate;
    map['deletedBy'] = _deletedBy;
    map['storeCount'] = _storeCount;
    map['color'] = _color;
    map['brandNumber'] = _brandNumber;
    return map;
  }
}
