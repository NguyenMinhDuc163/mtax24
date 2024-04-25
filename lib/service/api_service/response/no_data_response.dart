// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



class NoDataResponse {
  NoDataResponse({
    this.responseCode,
    this.message,
    this.verhtkk,
    this.veritaxviewer,
  });
  final String responseCode;
  final dynamic message;
  final dynamic verhtkk;
  final dynamic veritaxviewer;

  NoDataResponse copyWith({
    String responseCode,
    dynamic message,
    dynamic verhtkk,
    dynamic veritaxviewer,
  }) =>
      NoDataResponse(
        responseCode: responseCode ?? this.responseCode,
        message: message ?? this.message,
        verhtkk: verhtkk ?? this.verhtkk,
        veritaxviewer: veritaxviewer ?? this.veritaxviewer,
      );

  factory NoDataResponse.fromJson(Map<String, dynamic> json) => NoDataResponse(
    responseCode: json["responseCode"] == null ? null : json["responseCode"],
    message: json["message"],
    verhtkk: json["verhtkk"],
    veritaxviewer: json["veritaxviewer"],
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode == null ? null : responseCode,
    "message": message,
    "verhtkk": verhtkk,
    "veritaxviewer": veritaxviewer,
  };
}
