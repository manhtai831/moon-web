import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/view/topic/topic_controller.dart';
import 'package:shop_all_fe/view/vocabulary/vocabulary_controller.dart';

class VocabularyPage extends GetView<VocabularyController> {
  VocabularyPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => VocabularyController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
