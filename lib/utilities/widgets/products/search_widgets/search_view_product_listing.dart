import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m2/services/app_responsive.dart';
import 'package:m2/services/scroll_behavoir.dart';
import 'package:m2/utilities/utilities.dart';
import 'package:m2/utilities/widgets/widgets.dart';
import 'package:m2/views/product_views/product_view.dart';

class SearchviewVerticalListing extends StatefulWidget {
  const SearchviewVerticalListing({super.key, this.title, this.id, required this.children, this.gridSize, this.aspectRatio, this.padding});
  final String? title;
  final String? id;
  final List<Widget> children;
  final int? gridSize;
  final double? aspectRatio;
  final EdgeInsets? padding;
  @override
  State<SearchviewVerticalListing> createState() => _SearchviewVerticalListingState();
}

class _SearchviewVerticalListingState extends State<SearchviewVerticalListing> {
  final ScrollController _controller = ScrollController();
  bool atEdge = false;
  bool atBegining = true;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == 0) {
        atBegining = true;
        atEdge = false;
        setState(() {});
      } else if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        atBegining = false;
        atEdge = true;
        setState(() {});
      } else {
        atBegining = false;
        atEdge = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        if (widget.title != null) TwoColoredTitle(title: widget.title!, firstHeadColor: AppColors.kPrimaryColor, secondHeadColor: Colors.black),
        Container(
          height: size.width * 2,
          constraints: const BoxConstraints(maxHeight: 500),
          child: LayoutBuilder(builder: (context, totalConstraints) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _controller,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.gridSize ?? 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: widget.aspectRatio ?? 1,
              ),
              padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20),
              itemCount: widget.children.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onHover: (value) => setState(() => _isHovered = value),
                  onTap: () {
                    context.go("/${ProductView.route}?viewAll=true&categoryId=${widget.id}");
                  },
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 340),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: AppResponsive.isMobile(context)
                          ? [BoxShadow(color: AppColors.evenFadedText, blurRadius: 5)]
                          : !_isHovered
                              ? null
                              : [BoxShadow(color: AppColors.evenFadedText, blurRadius: 5)],
                    ),
                    alignment: Alignment.center,
                    child: widget.children[index],
                  ),
                );
              },
            );
          }),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
