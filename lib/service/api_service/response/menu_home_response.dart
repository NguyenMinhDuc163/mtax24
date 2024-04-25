
class MenuHomeResponse {
  MenuHomeResponse(
      {this.moduleId,
      this.title,
      this.contains,
      this.url,
      this.icon,
      this.checked = false});

  final int moduleId;
  final String title;
  final List<Contain> contains;
  final String url;
  final String icon;
  final bool checked;
  //
  // factory MenuHomeModel.fromJson(String str) => MenuHomeModel.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory MenuHomeResponse.fromJson(Map<String, dynamic> json) =>
      MenuHomeResponse(
        moduleId: json["moduleId"] == null ? null : json["moduleId"],
        title: json["title"] == null ? null : json["title"],
        contains: json["contains"] == null
            ? null
            : List<Contain>.from(
                json["contains"].map((x) => Contain.fromJson(x))),
        url: json["url"] == null ? null : json["url"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "moduleId": moduleId == null ? null : moduleId,
        "title": title == null ? null : title,
        "contains": contains == null
            ? null
            : List<dynamic>.from(contains.map((x) => x.toJson())),
        "url": url == null ? null : url,
        "icon": icon == null ? null : icon,
      };
}

class Contain {
  Contain(
      {this.moduleId, this.displayName, this.id, this.routerName, this.icon});

  final String moduleId;
  final String displayName;
  final String id;
  final String routerName;
  final String icon;

  // factory Contain.fromJson(String str) => Contain.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory Contain.fromJson(Map<String, dynamic> json) => Contain(
        moduleId: json["moduleId"] == null ? null : json["moduleId"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        id: json["id"] == null ? null : json["id"],
        routerName: json["routerName"] == null ? null : json["routerName"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "moduleId": moduleId == null ? null : moduleId,
        "displayName": displayName == null ? null : displayName,
        "id": id == null ? null : id,
        "routerName": routerName == null ? null : routerName,
        "icon": icon == null ? null : icon,
      };
}
