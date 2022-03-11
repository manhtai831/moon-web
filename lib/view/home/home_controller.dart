import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/base_controller.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/view/home/home_stack.dart';

class HomeController extends BaseController {
  var title = 'Người dùng'.obs;
  var index = 0.obs;

  @override
  Future initialData() async {
    setStatus(Status.success);
  }

  void setHomeStack(HomeStack homeStack) {
    switch (homeStack) {
      case HomeStack.User:
        title.value = 'Người dùng';
        index.value = 0;
        break;
      case HomeStack.Topic:
        title.value = 'Chủ đề';
        index.value = 1;
        break;
      case HomeStack.Vocabulary:
        title.value = 'Từ vựng';
        index.value = 2;
        break;
    }
  }
}
