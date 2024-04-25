
import 'dart:convert';

List<TieuDeTinTucResponse> tieuDeTinTucResponseFromJson(String str) => List<TieuDeTinTucResponse>.from(json.decode(str).map((x) => TieuDeTinTucResponse.fromJson(x)));

String tieuDeTinTucResponseToJson(List<TieuDeTinTucResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TieuDeTinTucResponse {
  TieuDeTinTucResponse({
    this.categorynewsId,
    this.categorynewsTitle,
    this.categorynewsContent,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.status,
    this.categoryOder,
    this.categoryId,
    this.attachmentId,
    this.categorySubcontent,
    this.userUpdate,
    this.userCreate,
    this.previewImagePath,
    this.categoryName,
    this.isShowHome,
    this.categoryType,
    this.urlRewrite,
    this.tieuDeTinTucResponseCategoryName,
    this.metaTag,
    this.urlMetaTag,
    this.pCategoryId,
  });

  final int categorynewsId;
  final String categorynewsTitle;
  final String categorynewsContent;
  final int createBy;
  final int createTime;
  final int updateBy;
  final int updateTime;
  final String status;
  final int categoryOder;
  final int categoryId;
  final int attachmentId;
  final String categorySubcontent;
  final dynamic userUpdate;
  final dynamic userCreate;
  final dynamic previewImagePath;
  final dynamic categoryName;
  final dynamic isShowHome;
  final dynamic categoryType;
  final String urlRewrite;
  final String tieuDeTinTucResponseCategoryName;
  final String metaTag;
  final dynamic urlMetaTag;
  final dynamic pCategoryId;

  factory TieuDeTinTucResponse.fromJson(Map<String, dynamic> json) => TieuDeTinTucResponse(
    categorynewsId: json["categorynewsId"] == null ? null : json["categorynewsId"],
    categorynewsTitle: json["categorynewsTitle"] == null ? null : json["categorynewsTitle"],
    categorynewsContent: json["categorynewsContent"] == null ? null : json["categorynewsContent"],
    createBy: json["createBy"] == null ? null : json["createBy"],
    createTime: json["createTime"] == null ? null : json["createTime"],
    updateBy: json["updateBy"] == null ? null : json["updateBy"],
    updateTime: json["updateTime"] == null ? null : json["updateTime"],
    status: json["status"] == null ? null : json["status"],
    categoryOder: json["categoryOder"] == null ? null : json["categoryOder"],
    categoryId: json["categoryId"] == null ? null : json["categoryId"],
    attachmentId: json["attachmentId"] == null ? null : json["attachmentId"],
    categorySubcontent: json["categorySubcontent"] == null ? null : json["categorySubcontent"],
    userUpdate: json["userUpdate"],
    userCreate: json["userCreate"],
    previewImagePath: json["previewImagePath"],
    categoryName: json["categoryName"],
    isShowHome: json["is_show_home"],
    categoryType: json["category_type"],
    urlRewrite: json["url_rewrite"] == null ? null : json["url_rewrite"],
    tieuDeTinTucResponseCategoryName: json["category_name"] == null ? null : json["category_name"],
    metaTag: json["meta_tag"] == null ? null : json["meta_tag"],
    urlMetaTag: json["url_meta_tag"],
    pCategoryId: json["p_category_id"],
  );

  Map<String, dynamic> toJson() => {
    "categorynewsId": categorynewsId == null ? null : categorynewsId,
    "categorynewsTitle": categorynewsTitle == null ? null : categorynewsTitle,
    "categorynewsContent": categorynewsContent == null ? null : categorynewsContent,
    "createBy": createBy == null ? null : createBy,
    "createTime": createTime == null ? null : createTime,
    "updateBy": updateBy == null ? null : updateBy,
    "updateTime": updateTime == null ? null : updateTime,
    "status": status == null ? null : status,
    "categoryOder": categoryOder == null ? null : categoryOder,
    "categoryId": categoryId == null ? null : categoryId,
    "attachmentId": attachmentId == null ? null : attachmentId,
    "categorySubcontent": categorySubcontent == null ? null : categorySubcontent,
    "userUpdate": userUpdate,
    "userCreate": userCreate,
    "previewImagePath": previewImagePath,
    "categoryName": categoryName,
    "is_show_home": isShowHome,
    "category_type": categoryType,
    "url_rewrite": urlRewrite == null ? null : urlRewrite,
    "category_name": tieuDeTinTucResponseCategoryName == null ? null : tieuDeTinTucResponseCategoryName,
    "meta_tag": metaTag == null ? null : metaTag,
    "url_meta_tag": urlMetaTag,
    "p_category_id": pCategoryId,
  };
}
