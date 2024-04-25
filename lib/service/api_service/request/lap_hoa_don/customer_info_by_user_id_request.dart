
import 'dart:convert';

CustomerInfoByUserIdRequest customerInfoByUserIdRequestFromJson(String str) => CustomerInfoByUserIdRequest.fromJson(json.decode(str));

String customerInfoByUserIdRequestToJson(CustomerInfoByUserIdRequest data) => json.encode(data.toJson());

class CustomerInfoByUserIdRequest {
  CustomerInfoByUserIdRequest({
    this.customerCode,
  });

  final String customerCode;

  factory CustomerInfoByUserIdRequest.fromJson(Map<String, dynamic> json) => CustomerInfoByUserIdRequest(
    customerCode: json["customer_code"] == null ? null : json["customer_code"],
  );

  Map<String, dynamic> toJson() => {
    "customer_code": customerCode == null ? null : customerCode,
  };
}
