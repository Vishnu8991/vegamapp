import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:m2/services/api_services/product_apis.dart';
import 'package:m2/services/app_responsive.dart';
import 'package:m2/services/models/product_model.dart';
import 'package:m2/services/state_management/cart/cart_data.dart';
import 'package:m2/services/state_management/token/token.dart';
import 'package:m2/services/state_management/user/user_data.dart';
import 'package:m2/utilities/utilities.dart';
import 'package:m2/views/product_views/product_view.dart';
import 'package:provider/provider.dart';

class SearchviewProductItem extends StatefulWidget {
  const SearchviewProductItem({
    super.key,
    required this.productModel,
    required this.sku,
  });

  final Items productModel;
  final String sku;

  @override
  State<SearchviewProductItem> createState() => _SearchviewProductItemState();
}

class _SearchviewProductItemState extends State<SearchviewProductItem> {
  bool _isHovered = false;
  bool isWishlistLoading = false;
  late AuthToken authToken;
  late CartData cartData;
  late UserData userData;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartData = Provider.of<CartData>(context);
    authToken = Provider.of<AuthToken>(context);
    userData = Provider.of<UserData>(context);
  }

  @override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return InkWell(
    hoverColor: Colors.transparent,
    onTap: () => context.push('/${ProductView.route}/${widget.productModel.urlKey}.${widget.productModel.urlSuffix}'),
    onHover: (value) => setState(() => _isHovered = value),
    child: Container(
      padding: const EdgeInsets.all(5),
      constraints: const BoxConstraints(maxHeight: 400),
      decoration: BoxDecoration(
        color: AppColors.scaffoldColor,
        borderRadius: BorderRadius.zero,
        boxShadow: AppResponsive.isMobile(context)
            ? [BoxShadow(color: AppColors.evenFadedText, blurRadius: 5)]
            : !_isHovered
                ? null
                : [BoxShadow(color: AppColors.evenFadedText, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(widget.productModel.image!.url!),
                ),
              ),
              alignment: Alignment.topRight,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "${widget.productModel.name}",
            style: AppStyles.getMediumTextStyle(fontSize: 14, color: AppColors.fadedText),
            maxLines: 1,overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
}
