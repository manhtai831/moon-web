import 'package:shop_all_fe/system/model/user_information.dart';

class UserManager {
  static UserManager? _userManager;
  UserInformation? _userInfo;

  static UserManager getInstance() {
    return _userManager ??= UserManager();
  }

  void setUser(UserInformation u) {
    _userInfo = u;
  }

  UserInformation? getUser() {
    return _userInfo;
  }
}
