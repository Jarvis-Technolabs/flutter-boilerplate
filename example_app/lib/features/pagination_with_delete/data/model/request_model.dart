class PaginationRequestModel {
  PaginationRequestModel({
    String? pageNumber,
    String? pageSize,
    String? sortColumn,
    String? sortDirection,
    String? searchText,
    String? totalRecords,
  }) {
    pageNumbers = pageNumber;
    _pageSize = pageSize;
    _sortColumn = sortColumn;
    _sortDirection = sortDirection;
    _searchText = searchText;
    _totalRecords = totalRecords;
  }

  PaginationRequestModel.fromJson(dynamic json) {
    pageNumbers = json['pageNumber'];
    _pageSize = json['pageSize'];
    _sortColumn = json['sortColumn'];
    _sortDirection = json['sortDirection'];
    _searchText = json['searchText'];
    _totalRecords = json['totalRecords'];
  }
  String? pageNumbers;
  String? _pageSize;
  String? _sortColumn;
  String? _sortDirection;
  String? _searchText;
  String? _totalRecords;

  String? get pageNumber => pageNumbers;
  String? get pageSize => _pageSize;
  String? get sortColumn => _sortColumn;
  String? get sortDirection => _sortDirection;
  String? get searchText => _searchText;
  String? get totalRecords => _totalRecords;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNumber'] = pageNumbers;
    map['pageSize'] = _pageSize;
    map['sortColumn'] = _sortColumn;
    map['sortDirection'] = _sortDirection;
    map['searchText'] = _searchText;
    map['totalRecords'] = _totalRecords;
    return map;
  }
}
