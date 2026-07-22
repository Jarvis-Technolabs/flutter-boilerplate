class DeleteRequestModel {
  DeleteRequestModel({String? brandId}) {
    _brandId = brandId;
  }

  DeleteRequestModel.fromJson(dynamic json) {
    _brandId = json['brandId'];
  }

  String? _brandId;

  String? get brandId => _brandId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['brandId'] = _brandId;
    return map;
  }
}
