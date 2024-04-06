import 'package:get/get.dart';

class CategoryController extends GetxController {
  final RxString _category = ''.obs;
  final RxString _title = ''.obs;

  set updateCategory(String value) {
    _category.value = value;
  }

  set updateTitle(String value) {
    _title.value = value;
  }

  String get category => _category.value;

  String get title => _title.value;
}
