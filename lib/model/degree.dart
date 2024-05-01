/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Degree {
  String? name;
  String? videoUrl;
  String? id;
  bool? deleted;
  String? creationDate;

  Degree({this.name, this.videoUrl, this.id, this.deleted, this.creationDate});

  Degree.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    videoUrl = json['videoUrl'];
    id = json['id'];
    deleted = json['deleted'];
    creationDate = json['creationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['videoUrl'] = videoUrl;
    data['id'] = id;
    data['deleted'] = deleted;
    data['creationDate'] = creationDate;
    return data;
  }
}
