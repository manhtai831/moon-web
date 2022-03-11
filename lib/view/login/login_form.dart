import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/theme_manager.dart';
import 'package:shop_all_fe/common/core/widget/base_image.dart';
import 'package:shop_all_fe/common/core/widget/base_textformfield.dart';
import 'package:shop_all_fe/common/core/widget/button/base_elevate_button.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/view/login/login_controller.dart';

class LoginForm extends GetWidget<LoginController> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseImage.asserts(path: ImageResource.favicon),
          const SizedBox(height: 32),
          Text('Đăng nhập', style: appStyle.textTheme.headline1),
          const SizedBox(height: 64),
          BaseTextFormField(
            editingController: controller.userName,
            hint: 'Tên tài khoản',
            isBorder: true,
            onValidator: (value) => controller.validate(0, value),
          ),
          const SizedBox(height: 16),
          BaseTextFormField(
            editingController: controller.password,
            hint: 'Mật khẩu',
            obscureText: true,
            textInputAction: TextInputAction.go,
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus();
              controller.fetchData();
            },
            onValidator: (value) => controller.validate(1, value),
          ),
          const SizedBox(height: 32),
          BaseElevatedButton(
            onTab: () => controller.fetchData(),
            title: 'Đăng nhập',
          )
        ],
      ),
    );
    ;
  }
}
