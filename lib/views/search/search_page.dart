import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/custom_container.dart';
import 'package:flutter_multi_vendor/commons/custom_text_widget.dart';
import 'package:flutter_multi_vendor/commons/shimmers/foodlist_shimmer.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/controllers/search_food_controller.dart';
import 'package:flutter_multi_vendor/views/search/loading_widget.dart';
import 'package:flutter_multi_vendor/views/search/search_result.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());

    return Obx(
      () => Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          toolbarHeight: 74.h,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: CustomTextWidget(
              focusNode: _searchFocusNode,
              controller: _searchController,
              keyboardType: TextInputType.text,
              hintText: 'Search for foods',
              suffixIcon: GestureDetector(
                onTap: () {
                  if (!controller.isSearchTriggered) {
                    controller.searchFoods(_searchController.text);
                    controller.setSearchTriggered(true);
                  } else {
                    controller.searchResults = null;
                    controller.setSearchTriggered(false);
                    _searchController.clear();
                  }
                },
                child: Icon(
                  !controller.isSearchTriggered
                      ? Icons.search_rounded
                      : Icons.close_rounded,
                  color: controller.searchResults == null ? kPrimary : kRed,
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmit: (query) {
                controller.searchFoods(query);
                controller.setSearchTriggered(true);
              },
            ),
          ),
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () =>
                _searchFocusNode.hasFocus ? _searchFocusNode.unfocus() : null,
            child: CustomContainer(
              backgroundColor: Colors.white,
              containerContent: controller.isLoading
                  ? const FoodsListShimmer()
                  : controller.searchResults == null
                      ? const LoadingWidget()
                      : const SearchResult(),
            ),
          ),
        ),
      ),
    );
  }
}