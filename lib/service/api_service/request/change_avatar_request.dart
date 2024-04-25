import 'dart:convert';

ChangeAvatarRequest changeAvatarRequestFromJson(String str) => ChangeAvatarRequest.fromJson(json.decode(str));

String changeAvatarRequestToJson(ChangeAvatarRequest data) => json.encode(data.toJson());

class ChangeAvatarRequest {
  ChangeAvatarRequest({
    this.avatar,
  });

  final String avatar;

  factory ChangeAvatarRequest.fromJson(Map<String, dynamic> json) => ChangeAvatarRequest(
    avatar: json["avatar"] == null ? null : json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar == null ? null : avatar,
  };
}
