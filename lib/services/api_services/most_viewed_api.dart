class MostViewed {

  static String mostViewedProducts = r'''
    query mostViewedProducts($pageSize: Int!, $currentPage: Int) {
      mostViewedProducts(search: "", pageSize: 20, currentPage: 1) {
        currentPage
        items {
          sku
        }
        pageSize
        totalPages
        totalCount
      }
    }
  ''';
}
