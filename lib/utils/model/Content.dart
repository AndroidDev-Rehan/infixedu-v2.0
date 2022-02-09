class Content {
  int id;
  String contentTitle;
  String contentType;
  int availableForAdmin;
  int availableForAllClasses;
  String uploadDate;
  dynamic description;
  dynamic sourceUrl;
  String uploadFile;
  int activeStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic contentListClass;
  dynamic section;
  int createdBy;
  int updatedBy;
  int schoolId;
  int academicId;

  Content({
    this.id,
    this.contentTitle,
    this.contentType,
    this.availableForAdmin,
    this.availableForAllClasses,
    this.uploadDate,
    this.description,
    this.sourceUrl,
    this.uploadFile,
    this.activeStatus,
    this.createdAt,
    this.updatedAt,
    this.contentListClass,
    this.section,
    this.createdBy,
    this.updatedBy,
    this.schoolId,
    this.academicId,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json["id"],
      contentTitle: json["content_title"],
      contentType: json["content_type"],
      availableForAdmin: json["available_for_admin"],
      availableForAllClasses: json["available_for_all_classes"],
      uploadDate: json["upload_date"],
      description: json["description"],
      sourceUrl: json["source_url"],
      uploadFile: json["upload_file"],
      activeStatus: json["active_status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      contentListClass: json["class"],
      section: json["section"],
      createdBy: json["created_by"],
      updatedBy: json["updated_by"],
      schoolId: json["school_id"],
      academicId: json["academic_id"],
    );
  }
}

class ContentList {
  List<Content> contents;

  ContentList(this.contents);

  factory ContentList.fromJson(List<dynamic> json) {
    List<Content> contentList = [];

    contentList = json.map((i) => Content.fromJson(i)).toList();

    return ContentList(contentList);
  }
}
