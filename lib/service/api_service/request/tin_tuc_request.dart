import 'dart:convert';

TinTucRequest tinTucRequestFromJson(String str) => TinTucRequest.fromJson(json.decode(str));

String tinTucRequestToJson(TinTucRequest data) => json.encode(data.toJson());

class TinTucRequest {
  TinTucRequest({
    this.lang,
  });

  final String lang;

  factory TinTucRequest.fromJson(Map<String, dynamic> json) => TinTucRequest(
    lang: json["lang"] == null ? null : json["lang"],
  );

  Map<String, dynamic> toJson() => {
    "lang": lang == null ? null : lang,
  };
}
