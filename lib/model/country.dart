/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Country {
  String? id;
  bool? deleted;
  String? creationDate;
  String? name;

  Country({this.id, this.deleted, this.creationDate, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deleted = json['deleted'];
    creationDate = json['creationDate'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['deleted'] = deleted;
    data['creationDate'] = creationDate;
    data['name'] = name;
    return data;
  }
}
