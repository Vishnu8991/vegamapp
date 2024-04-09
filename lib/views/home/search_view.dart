import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:m2/services/api_services/api_services.dart';
import 'package:m2/services/app_responsive.dart';
import 'package:m2/services/models/product_model.dart';
import 'package:m2/services/search_services.dart';
import 'package:m2/services/state_management/cart/cart_data.dart';
import 'package:m2/services/state_management/home/home_data.dart';
import 'package:m2/services/state_management/most_viewed_products/most_viewed_products.dart';
import 'package:m2/services/state_management/token/token.dart';
import 'package:m2/utilities/utilities.dart';
import 'package:m2/utilities/widgets/loading_builder.dart';
import 'package:m2/utilities/widgets/products/search_widgets/search_view_product_item.dart';
import 'package:m2/utilities/widgets/products/search_widgets/search_view_product_listing.dart';
import 'package:m2/utilities/widgets/scaffold_body.dart';
import 'package:m2/views/product_views/product_view.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  static String route = 'search';
  @override
  State<SearchView> createState() => _SearchViewState();
}

// Only on mobile. Seperate page for search

class _SearchViewState extends State<SearchView> {
  List<String> dropDownItem = ['All', 'Mobile', 'Accessories'];
  String dropDownValue = 'All';
  TextEditingController searchQuery = TextEditingController();
  ScrollController scrollController = ScrollController();

  HomeData homeData = HomeData();
  MostViewedData mostViewedData = MostViewedData();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final currentContext = context;

    // Check if the widget is still mounted
    if (mounted) {
      var cartData = Provider.of<CartData>(currentContext, listen: false);
      var authToken = Provider.of<AuthToken>(currentContext, listen: false);

      homeData.getHomeData(currentContext).then((_) {
        // Check if the widget is still mounted before updating state
        if (mounted) {
          // Update state or trigger rebuild
        }
      });

      cartData.getCartData(currentContext, authToken).then((_) {
        // Check if the widget is still mounted before updating state
        if (mounted) {
          // Update state or trigger rebuild
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BuildScaffold(
      currentIndex: 1,
      child: Column(
        children: [
          // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     InkWell(onTap: () => print(mostViewedData.data), child: Text("Most Click")),
          //     InkWell(onTap: () => print(homeData.data), child: Text("Home Click")),
          //   ],
          // ),
          Container(
            width: size.width,
            height: 50,
            margin: EdgeInsets.all(size.width * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 1, color: AppColors.fadedText),
            ),
            child: TextFieldSearch(
              label: 'Search',
              controller: searchQuery,
              future: () => ApiServices().searchSuggessionApi(
                  searchQuery: searchQuery.text, context: context),
              itemsInView: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(300),
                  borderSide: BorderSide(color: AppColors.evenFadedText),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(300),
                  borderSide: BorderSide(color: AppColors.evenFadedText),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                hintText: "Search",
                hintStyle: AppStyles.getRegularTextStyle(
                    fontSize: 14, color: AppColors.primaryColor),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      context.push(Uri(
                              path: '/${ProductView.route}',
                              queryParameters: {"search": searchQuery.text})
                          .toString());
                    },
                    // icon: Icon(Icons.search, color: AppColors.fadedText),
                    icon: Icon(Icons.search, color: AppColors.searchButton),
                  ),
                ),
              ),
              onSubmitted: (value) => context.push(Uri(
                  path: '/${ProductView.route}',
                  queryParameters: {"search": searchQuery.text}).toString()),
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return Observer(builder: (context) {
                if (homeData.isLoading) {
                  return BuildLoadingWidget(color: AppColors.primaryColor);
                }
                if (homeData.hasExceptions) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(homeData.errorMsg!,
                          style: AppStyles.getMediumTextStyle(fontSize: 14)),
                    ),
                  );
                }
                return ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: scrollController,
                      itemCount:
                          homeData.data['homepage']!['blocks']!['data'].length,
                      itemBuilder: (context, index) => getWidgets(
                          homeData.data['homepage']!['blocks']!['data'][index],
                          constraints),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              });
            }),
          ),
        ],
      ),
    );
  }

  getWidgets(Map<String, dynamic> data, BoxConstraints constraints) {
    // Check if its not for mobile
    if (AppResponsive.isMobile(context) && !data['mobile_status']) {
      return const SizedBox();
    }
    // Check if its not for desktop
    if (!AppResponsive.isMobile(context) && !data['desktop_status']) {
      return const SizedBox();
    }

    if (data['display_style'] == 'slider') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          InkWell(
            onTap: () => print(homeData.data),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Popular Products",
                style: AppStyles.getMediumTextStyle(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth > 1400
                    ? (constraints.maxWidth - 1400) / 2
                    : 0,
                vertical: 20),
            child: SearchviewVerticalListing(
              title: data['show_title'] ? data['title'] : null,
              id: data['id'].toString(),
              children: List<SearchviewProductItem>.generate(
                data['products'].length,
                (index) {
                  var productModel = Items.fromJson(data['products'][index]);
                  return SearchviewProductItem(
                    productModel: productModel,
                    sku: productModel.sku!,
                  );
                },
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
