
import 'dart:convert';

DMucNHangTTeRequest dMucNHangTTeRequestFromJson(String str) => DMucNHangTTeRequest.fromJson(json.decode(str));

String dMucNHangTTeRequestToJson(DMucNHangTTeRequest data) => json.encode(data.toJson());

class DMucNHangTTeRequest {
  DMucNHangTTeRequest({
    this.mstNban,
    this.isTraCuu,
  });

  final String mstNban;
  final String isTraCuu;

  factory DMucNHangTTeRequest.fromJson(Map<String, dynamic> json) => DMucNHangTTeRequest(
    mstNban: json["mstNban"] == null ? null : json["mstNban"],
    isTraCuu: json["isTraCuu"] == null ? null : json["isTraCuu"],
  );

  Map<String, dynamic> toJson() => {
    "mstNban": mstNban == null ? null : mstNban,
    "isTraCuu": isTraCuu == null ? null : isTraCuu,
  };
}
