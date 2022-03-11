import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/view/login/login_form.dart';

import 'login_controller.dart';

class LoginPage extends BaseView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => LoginController());

  @override
  Widget buildSuccess(BuildContext context) {
    return BaseView<LoginController>(
      onSuccess: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: Get.width / 2, child: BaseImage.asserts(path: ImageResource.logo)),
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
          const Expanded(child: const LoginForm()),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
