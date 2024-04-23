
class ImagesDataModel {
  String? status;
  Data? data;
  String? message;

  ImagesDataModel({this.status, this.data, this.message});

  ImagesDataModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["message"] = message;
    return _data;
  }
}

class Data {
  List<String>? images;

  Data({this.images});

  Data.fromJson(Map<String, dynamic> json) {
    images = json["images"] == null ? null : List<String>.from(json["images"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(images != null) {
      _data["images"] = images;
    }
    return _data;
  }
}