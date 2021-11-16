class StudentInformation {
  int? id;
  int? userId;
  String? name;
  String? photo;
  int? classId;
  String? className;
  int? levelId;
  String? levelName;
  int? semesterId;
  String? semesterName;
  int? academicYearId;
  String? academicYearName;
  int? schoolId;

  StudentInformation(
      {this.id,
      this.userId,
      this.name,
      this.photo,
      this.classId,
      this.className,
      this.levelId,
      this.levelName,
      this.semesterId,
      this.semesterName,
      this.academicYearId,
      this.academicYearName,
      this.schoolId});

  StudentInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    photo = json['photo'];
    classId = json['classId'];
    className = json['className'];
    levelId = json['levelId'];
    levelName = json['levelName'];
    semesterId = json['semesterId'];
    semesterName = json['semesterName'];
    academicYearId = json['academicYearId'];
    academicYearName = json['academicYearName'];
    schoolId = json['schoolId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['classId'] = this.classId;
    data['className'] = this.className;
    data['levelId'] = this.levelId;
    data['levelName'] = this.levelName;
    data['semesterId'] = this.semesterId;
    data['semesterName'] = this.semesterName;
    data['academicYearId'] = this.academicYearId;
    data['academicYearName'] = this.academicYearName;
    data['schoolId'] = this.schoolId;
    return data;
  }
}
