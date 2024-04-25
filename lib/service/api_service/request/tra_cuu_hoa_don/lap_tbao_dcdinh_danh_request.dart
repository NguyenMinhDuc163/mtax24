class LapTBaoDCDinhDanhRequest {


  LapTBaoDCDinhDanhRequest({
    this.idDtl,
    this.loaihoadonDtl,
    this.sohdgocDtl,

  });

  final List<String> idDtl;
  final List<String> loaihoadonDtl;
  final List<String> sohdgocDtl;
  

  factory LapTBaoDCDinhDanhRequest.fromJson(Map<String, dynamic> json) => LapTBaoDCDinhDanhRequest(
    idDtl: json["idDtl"] == null ? null : List<String>.from(json["idDtl"].map((x) => x)),
    loaihoadonDtl: json["loaihoadonDtl"] == null ? null : List<String>.from(json["loaihoadonDtl"].map((x) => x)),
    sohdgocDtl: json["sohdgocDtl"] == null ? null : List<String>.from(json["sohdgocDtl"].map((x) => x)),
    
  );

  Map<String, dynamic> toJson() => {
    "idDtl": idDtl == null ? null : List<dynamic>.from(idDtl.map((x) => x)),
    "loaihoadonDtl": loaihoadonDtl == null ? null : List<dynamic>.from(loaihoadonDtl.map((x) => x)),
    "sohdgocDtl": sohdgocDtl == null ? null : List<dynamic>.from(sohdgocDtl.map((x) => x)),
    
  };
}
