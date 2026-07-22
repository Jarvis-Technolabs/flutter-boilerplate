import 'package:example_app/features/pagination_with_delete/data/model/pagination_response.dart';
import 'package:example_app/features/pagination_with_delete/data/model/request_model.dart';

mixin ListingScreenPaginationMixin {
  late PaginationRequestModel paginationRequestModel;
  int pageClass = 0;
  int sizeAllList = 6;

  bool isLoading = false;
  List<PaginationItemData> dataList = [];

  initData() {
    pageClass = 0;
    paginationRequestModel = PaginationRequestModel(
        pageNumber: pageClass.toString(),
        pageSize: sizeAllList.toString(),
        totalRecords: '0',
        searchText: '',
        sortColumn: '',
        sortDirection: '');
  }
}
