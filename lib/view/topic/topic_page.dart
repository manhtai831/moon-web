import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/view/topic/topic_controller.dart';

class TopicPage extends GetView<TopicController> {
  TopicPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => TopicController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
