import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/widget/base_appbar.dart';
import 'package:shop_all_fe/common/core/widget/base_view.dart';
import 'package:shop_all_fe/view/home/home_controller.dart';
import 'package:shop_all_fe/view/topic/topic_page.dart';
import 'package:shop_all_fe/view/user/user_page.dart';
import 'package:shop_all_fe/view/vocabulary/vocabulary_page.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseView(
          status: controller.status.value,
          onSuccess: Scaffold(
            appBar: BaseAppBar(
              title: controller.title.value,
            ),
            body: IndexedStack(
              index: controller.index.value,
              children: [UserPage(), TopicPage(), VocabularyPage()],
            ),
          ),
        ));
  }
}
