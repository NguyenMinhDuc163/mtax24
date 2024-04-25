// To parse this JSON data, do
//
//     final traCuuThongBaoCqtRequest = traCuuThongBaoCqtRequestFromJson(jsonString);

class TraCuuTongHopHDRequest {
  TraCuuTongHopHDRequest({
    this.loaitbao,
    this.fromDate,
    this.toDate,
    this.status,
  });

  final String loaitbao;
  final String fromDate;
  final String toDate;
  final String status;

  factory TraCuuTongHopHDRequest.fromJson(Map<String, dynamic> json) => TraCuuTongHopHDRequest(
    loaitbao: json["loaitbao"] == null ? null : json["loaitbao"],
    fromDate: json["fromDate"] == null ? null : json["fromDate"],
    toDate: json["toDate"] == null ? null : json["toDate"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "loaitbao": loaitbao == null ? null : loaitbao,
    "fromDate": fromDate == null ? null : fromDate,
    "toDate": toDate == null ? null : toDate,
    "status": status == null ? null : status,
  };
}
