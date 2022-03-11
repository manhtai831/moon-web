class UserInformation {
  String? sId;
  String? name;
  String? userName;
  String? password;
  String? email;
  String? gender;
  String? address;
  String? birth;
  List<int>? permission;
  String? avatar;
  String? createdAt;
  String? token;
  int? id;
  int? iV;
  String? updatedAt;

  UserInformation(
      {this.sId,
      this.name,
      this.userName,
      this.password,
      this.email,
      this.gender,
      this.address,
      this.birth,
      this.permission,
      this.avatar,
      this.createdAt,
      this.token,
      this.id,
      this.iV,
      this.updatedAt});

  UserInformation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    userName = json['userName'];
    password = json['password'];
    email = json['email'];
    gender = json['gender'];
    address = json['address'];
    birth = json['birth'];
    permission = json['permission'].cast<int>();
    avatar = json['avatar'];
    createdAt = json['createdAt'];
    token = json['token'];
    id = json['id'];
    iV = json['__v'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['birth'] = this.birth;
    data['permission'] = this.permission;
    data['avatar'] = this.avatar;
    data['createdAt'] = this.createdAt;
    data['token'] = this.token;
    data['id'] = this.id;
    data['__v'] = this.iV;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
