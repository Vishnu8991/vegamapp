import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide Store;
import 'package:m2/services/api_services/most_viewed_api.dart';
import 'package:mobx/mobx.dart';
part 'most_viewed_products.g.dart';

class MostViewedData = _MostViewedDataBase with _$MostViewedData;

abstract class _MostViewedDataBase with Store {
  @observable
  Map<String, dynamic> _data = {};

  @computed
  Map<String, dynamic> get data => _data;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  String? _errorMsg;

  @observable
  bool _hasExceptions = false;

  @computed
  bool get hasExceptions => _hasExceptions;

  @computed
  String? get errorMsg => _errorMsg;

  @action
  void setLoading(bool value) => _isLoading = value;

  @action
  Future<void> fetchMostViewedData(BuildContext context) async {
    setLoading(true);
    var client = GraphQLProvider.of(context);
    final options = WatchQueryOptions(
      document: gql(MostViewed.mostViewedProducts),
      // variables: {
      //   'pageSize': pageSize,
      //   'currentPage': currentPage,
      // },
    );
    QueryResult? result = await client.value.query(options);

    if (result.hasException) {
      _hasExceptions = true;
      try {
        _errorMsg = result.exception!.graphqlErrors.first.message;
      } catch (e) {
        try {
          _errorMsg = result.exception!.linkException!.toString();
        } catch (e) {
          _errorMsg = "An error occurred. Please try again later";
        }
      }
    }

    _data = result.data ?? {};
    setLoading(false);
  }
}

// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart' hide Store;
// import 'package:m2/services/api_services/most_viewed_api.dart';
// import 'package:mobx/mobx.dart';
// part 'most_viewed_products.g.dart';

// // ignore: library_private_types_in_public_api
// class MostViewedData = _MostViewedDataBase with _$MostViewedData;

// abstract class _MostViewedDataBase with Store {
//   @observable
//   Map<String, dynamic> _data = {};
//   Map<String, dynamic> get data => _data;

//   @observable
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   @action
//   void setLoading(bool value) => _isLoading = value;

//   @action
//   getMostViewedProducts(BuildContext context, int pageSize, int currentPage) async {
//     setLoading(true);
//     var graphqlClient = GraphQLProvider.of(context);
//     QueryResult? result = await graphqlClient.value.query(WatchQueryOptions(document: gql(MostViewed.mostViewedProducts), variables: {
//       'pageSize': pageSize,
//       'currentPage': currentPage, 
//     }));
//     _data = result.data!;
//     setLoading(false);
//   }
// }
