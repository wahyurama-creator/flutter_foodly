import 'package:get/get.dart';

class TabIndexController extends GetxController {
  final RxInt _tabIndex = 0.obs;

  set setTabIndex(int index) {
    _tabIndex.value = index;
  }

  int get tabIndex => _tabIndex.value;
}
