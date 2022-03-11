class BaseOptionDropdown<T> {
  String? id;
  String? name;
  String? image;
  T? data;

  BaseOptionDropdown({this.id, this.name, this.image, this.data});

  BaseOptionDropdown.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    data = json['data'];
  }
}
