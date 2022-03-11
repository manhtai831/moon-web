import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/theme_manager.dart';
import 'package:shop_all_fe/common/core/widget/base_textformfield.dart';
import 'package:shop_all_fe/common/core/widget/button/base_elevate_button.dart';
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
          Text('Đăng nhập', style: appStyle.textTheme.headline1),
          const SizedBox(height: 32),
          BaseTextFormField(
            editingController: controller.userName,
            hint: 'Tên tài khoản',
            isBorder: true,
          ),
          const SizedBox(height: 12),
          BaseTextFormField(
            editingController: controller.userName,
            hint: 'Mật khẩu',
            textInputAction: TextInputAction.go,
            on
          ),
          const SizedBox(height: 32),
          BaseElevatedButton(
            onTab: () {},
            title: 'Đăng nhập',
          )
        ],
      ),
    );
    ;
  }
}
