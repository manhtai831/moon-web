import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/view/login/login_form.dart';

import 'login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseView(
        status: controller.status.value,
        onSuccess: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.8,
                child: BaseImage.asserts(path: ImageResource.logo, boxFit: BoxFit.cover)),
            SizedBox(
              height: Get.height * 0.8,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: VerticalDivider(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
            ),
            const Expanded(child: LoginForm()),
            const Expanded(child: SizedBox())
          ],
        ),
      ),
    );
  }
}
