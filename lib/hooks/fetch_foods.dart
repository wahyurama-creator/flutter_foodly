import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/models/base_response/base_list_response.dart';
import 'package:flutter_multi_vendor/models/errors/api_error.dart';
import 'package:flutter_multi_vendor/models/foods/food_model.dart';
import 'package:flutter_multi_vendor/models/hooks/hook_result.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchFoods({required int code}) {
  final foodsItem = useState<List<FoodModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      final url = Uri.parse('$appBaseUrl/api/foods/recommendation/$code');
      final response = await http.get(url);
      final result = BaseListResponse.fromJson(
        jsonDecode(response.body),
        (json) => FoodModel.fromJson(json),
      );

      if (result.status == 'success') {
        foodsItem.value = result.data;
      } else {
        apiError.value = ApiError.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: foodsItem.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
