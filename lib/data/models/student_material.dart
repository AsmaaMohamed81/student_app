class StudentMaterial {
  int? id;
  int? subjectId;
  String? subjectName;
  int? academicYearId;
  String? academicYearName;
  int? levelId;
  String? levelName;
  int? classId;
  String? className;
  String? groupName;
  int? semesterId;
  String? semesterName;
  int? schoolId;
  int? minAttandance;
  int? maxAttandance;
  String? startDate;
  String? endDate;

  StudentMaterial(
      {this.id,
      this.endDate,
      this.groupName,
      this.maxAttandance,
      this.classId,
      this.className,
      this.levelId,
      this.levelName,
      this.semesterId,
      this.semesterName,
      this.academicYearId,
      this.academicYearName,
      this.schoolId,
      this.startDate,
      this.minAttandance,
      this.subjectId,
      this.subjectName});

  StudentMaterial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    endDate = json['endDate'];
    startDate = json['startDate'];
    subjectName = json['subjectName'];
    subjectId = json['subjectId'];

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
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['subjectName'] = this.subjectName;
    data['subjectId'] = this.subjectId;

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
