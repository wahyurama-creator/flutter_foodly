import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/models/base_response/base_list_response.dart';
import 'package:flutter_multi_vendor/models/errors/api_error.dart';
import 'package:flutter_multi_vendor/models/foods/food_model.dart';
import 'package:flutter_multi_vendor/utility/network/logging_http_client.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  final RxBool _isSearchTriggered = false.obs;

  bool get isSearchTriggered => _isSearchTriggered.value;

  List<FoodModel>? searchResults;

  void setSearchTriggered(bool value) {
    _isSearchTriggered.value = value;
  }

  void searchFoods(String key) async {
    _isLoading.value = true;
    final uri = Uri.parse('$appBaseUrl/api/foods/search/$key');
    final client = LoggingHttpClient(http.Client());

    try {
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        final result = BaseListResponse.fromJson(
          jsonDecode(response.body),
          (json) => FoodModel.fromJson(json),
        );

        searchResults = result.data;
        _isLoading.value = false;
      } else {
        _isLoading.value = false;
        final errorMessage = ApiError.fromJson(jsonDecode(response.body));
        debugPrint('Search error: ${errorMessage.message}');
      }
    } catch (e) {
      _isLoading.value = false;
      debugPrint('Search error: $e');
    } finally {
      client.close();
    }
  }
}