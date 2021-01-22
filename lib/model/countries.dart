class CountriesAPI {
  List<Countries> data = [];
  bool success;
  String message;

  CountriesAPI({this.data, this.success, this.message});

  CountriesAPI.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Countries>();
      json['data'].forEach((v) {
        data.add(new Countries.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Countries {
  String code;
  String name;
  String flag;
  String id;

  Countries({this.code, this.name, this.flag, this.id});

  Countries.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    flag = json['flag'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['flag'] = this.flag;
    data['id'] = this.id;
    return data;
  }
}
