class Field {
  String? name;
  String? startDate;
  String? endDate;
  String? id;
  bool? deleted;
  String? creationDate;

  Field(
      {this.name,
      this.startDate,
      this.endDate,
      this.id,
      this.deleted,
      this.creationDate});

  Field.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    id = json['id'];
    deleted = json['deleted'];
    creationDate = json['creationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['id'] = this.id;
    data['deleted'] = this.deleted;
    data['creationDate'] = this.creationDate;
    return data;
  }
}
