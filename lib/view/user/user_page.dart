import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/view/user/user_controller.dart';

class UserPage extends GetView<UserController> {
  UserPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => UserController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
