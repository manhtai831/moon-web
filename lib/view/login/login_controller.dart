import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/page_manager/key_page.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/common/local_storage/user_manager.dart';
import 'package:shop_all_fe/system/model/user_information.dart';
import 'package:shop_all_fe/system/repository/user_repository.dart';

class LoginController extends BaseController {
  final _userRepository = UserRepository<LoginController>();
  Rx<UserInformation?> user = UserInformation().obs;
  var userName = TextEditingController(text: 'admin');
  var password = TextEditingController(text: '123@123a');

  @override
  Future initialData() async {
    setStatus(Status.success);
  }

  @override
  Future<void> fetchData() async {
    if (requestValidate()) return;
    setStatus(Status.waiting);
    var response = await _userRepository
        .login(UserInformation(userName: userName.text.trim(), password: password.text.trim()));
    if (response.isNulled) return;
    UserManager.getInstance().setUser(response!);
    Get.toNamed(KeyPage.home_page);
  }

  String? validate(int i, String? value) {
    if (!value.isNotNullBlank) {
      return 'Vui lòng nhập Tên tài khoản';
    }
    if (value!.length < 5) {
      return 'Tên tài khoản phải lớn hơn 5 ký tự';
    }
    return null;
  }

  bool requestValidate() {
    if (userName.text.length < 5 || password.text.length < 5) {
      setMessage('Vui lòng nhập đúng định dạng tài khoản mật khẩu');
      return true;
    }
    return false;
  }
}
