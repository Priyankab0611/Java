class ImageModel {
  List<String> files;
  String folderName;
  ImageModel({this.files, this.folderName});

  ImageModel.fromjson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folderName = json['folderName'];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['files'] = this.files;
    data['folderName'] = this.folderName;
    return data;
  }
}
