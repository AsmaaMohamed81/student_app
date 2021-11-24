class StudentDashboard {
  StudentInformation? studentInformation;
  List<Groups>? groups;
  List<DailyLectures>? dailyLectures;
  List<Exams>? exams;
  List<Assignments>? assignments;
  List<Subjects>? subjects;

  StudentDashboard(
      {this.studentInformation,
      this.groups,
      this.dailyLectures,
      this.exams,
      this.assignments,
      this.subjects});

  StudentDashboard.fromJson(Map<String, dynamic> json) {
    studentInformation = json['studentInformation'] != null
        ? StudentInformation.fromJson(json['studentInformation'])
        : null;
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(Groups.fromJson(v));
      });
    }
    if (json['dailyLectures'] != null) {
      dailyLectures = <DailyLectures>[];
      json['dailyLectures'].forEach((v) {
        dailyLectures!.add(DailyLectures.fromJson(v));
      });
    }
    if (json['exams'] != null) {
      exams = <Exams>[];
      json['exams'].forEach((v) {
        exams!.add(Exams.fromJson(v));
      });
    }
    if (json['assignments'] != null) {
      assignments = <Assignments>[];
      json['assignments'].forEach((v) {
        assignments!.add(Assignments.fromJson(v));
      });
    }
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (studentInformation != null) {
      data['studentInformation'] = studentInformation!.toJson();
    }
    if (groups != null) {
      data['groups'] = groups!.map((v) => v.toJson()).toList();
    }
    if (dailyLectures != null) {
      data['dailyLectures'] = dailyLectures!.map((v) => v.toJson()).toList();
    }
    if (exams != null) {
      data['exams'] = exams!.map((v) => v.toJson()).toList();
    }
    if (assignments != null) {
      data['assignments'] = assignments!.map((v) => v.toJson()).toList();
    }
    if (subjects != null) {
      data['subjects'] = subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['photo'] = photo;
    data['classId'] = classId;
    data['className'] = className;
    data['levelId'] = levelId;
    data['levelName'] = levelName;
    data['semesterId'] = semesterId;
    data['semesterName'] = semesterName;
    data['academicYearId'] = academicYearId;
    data['academicYearName'] = academicYearName;
    data['schoolId'] = schoolId;
    return data;
  }
}

class Groups {
  int? id;
  String? name;
  String? createDate;
  int? courseId;
  String? courseName;

  Groups({this.id, this.name, this.createDate, this.courseId, this.courseName});

  Groups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createDate = json['createDate'];
    courseId = json['courseId'];
    courseName = json['courseName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createDate'] = createDate;
    data['courseId'] = courseId;
    data['courseName'] = courseName;
    return data;
  }
}

class DailyLectures {
  int? courseId;
  int? organizationId;
  String? title;
  String? eventtype;
  String? start;
  String? end;
  String? className;
  String? description;
  bool? allDay;
  String? location;
  String? startUrl;
  String? joinUrl;
  String? meetingId;
  bool? isOpened;
  bool? isClosed;

  DailyLectures(
      {this.courseId,
      this.organizationId,
      this.title,
      this.eventtype,
      this.start,
      this.end,
      this.className,
      this.description,
      this.allDay,
      this.location,
      this.startUrl,
      this.joinUrl,
      this.meetingId,
      this.isOpened,
      this.isClosed});

  DailyLectures.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    organizationId = json['organizationId'];
    title = json['title'];
    eventtype = json['eventtype'];
    start = json['start'];
    end = json['end'];
    className = json['className'];
    description = json['description'];
    allDay = json['allDay'];
    location = json['location'];
    startUrl = json['startUrl'];
    joinUrl = json['joinUrl'];
    meetingId = json['meetingId'];
    isOpened = json['isOpened'];
    isClosed = json['isClosed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseId'] = courseId;
    data['organizationId'] = organizationId;
    data['title'] = title;
    data['eventtype'] = eventtype;
    data['start'] = start;
    data['end'] = end;
    data['className'] = className;
    data['description'] = description;
    data['allDay'] = allDay;
    data['location'] = location;
    data['startUrl'] = startUrl;
    data['joinUrl'] = joinUrl;
    data['meetingId'] = meetingId;
    data['isOpened'] = isOpened;
    data['isClosed'] = isClosed;
    return data;
  }
}

class Exams {
  int? id;
  String? code;
  String? name;
  bool? isDisplay;
  double? percentageToSuccess;
  bool? studentMultiAnswar;
  int? minutes;
  bool? isRandom;
  bool? isSomeNumber;
  int? numberQuestionDisplay;
  bool? isFinalExam;
  int? courseModuleId;
  String? courseModuleName;
  int? courseId;
  int? organizationId;
  String? courseName;
  String? catalogCourseName;
  String? createdDate;

  Exams(
      {this.id,
      this.code,
      this.name,
      this.isDisplay,
      this.percentageToSuccess,
      this.studentMultiAnswar,
      this.minutes,
      this.isRandom,
      this.isSomeNumber,
      this.numberQuestionDisplay,
      this.isFinalExam,
      this.courseModuleId,
      this.courseModuleName,
      this.courseId,
      this.organizationId,
      this.courseName,
      this.catalogCourseName,
      this.createdDate});

  Exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    isDisplay = json['isDisplay'];
    percentageToSuccess = json['percentageToSuccess'];
    studentMultiAnswar = json['studentMultiAnswar'];
    minutes = json['minutes'];
    isRandom = json['isRandom'];
    isSomeNumber = json['isSomeNumber'];
    numberQuestionDisplay = json['numberQuestionDisplay'];
    isFinalExam = json['isFinalExam'];
    courseModuleId = json['courseModuleId'];
    courseModuleName = json['courseModuleName'];
    courseId = json['courseId'];
    organizationId = json['organizationId'];
    courseName = json['courseName'];
    catalogCourseName = json['catalogCourseName'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['isDisplay'] = isDisplay;
    data['percentageToSuccess'] = percentageToSuccess;
    data['studentMultiAnswar'] = studentMultiAnswar;
    data['minutes'] = minutes;
    data['isRandom'] = isRandom;
    data['isSomeNumber'] = isSomeNumber;
    data['numberQuestionDisplay'] = numberQuestionDisplay;
    data['isFinalExam'] = isFinalExam;
    data['courseModuleId'] = courseModuleId;
    data['courseModuleName'] = courseModuleName;
    data['courseId'] = courseId;
    data['organizationId'] = organizationId;
    data['courseName'] = courseName;
    data['catalogCourseName'] = catalogCourseName;
    data['createdDate'] = createdDate;
    return data;
  }
}

class Assignments {
  int? id;
  int? courseGroupId;
  int? courseAssignmentId;
  String? assignmentCode;
  String? assignmentText;
  String? assignmentFile;
  double? assignmentDegree;
  String? assignmentDueDate;
  String? materialName;

  Assignments(
      {this.id,
      this.courseGroupId,
      this.courseAssignmentId,
      this.assignmentCode,
      this.assignmentText,
      this.assignmentFile,
      this.assignmentDegree,
      this.assignmentDueDate,
      this.materialName});

  Assignments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseGroupId = json['courseGroupId'];
    courseAssignmentId = json['courseAssignmentId'];
    assignmentCode = json['assignmentCode'];
    assignmentText = json['assignmentText'];
    assignmentFile = json['assignmentFile'];
    assignmentDegree = json['assignmentDegree'];
    assignmentDueDate = json['assignmentDueDate'];
    materialName = json['materialName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['courseGroupId'] = courseGroupId;
    data['courseAssignmentId'] = courseAssignmentId;
    data['assignmentCode'] = assignmentCode;
    data['assignmentText'] = assignmentText;
    data['assignmentFile'] = assignmentFile;
    data['assignmentDegree'] = assignmentDegree;
    data['assignmentDueDate'] = assignmentDueDate;
    data['materialName'] = materialName;
    return data;
  }
}

class Subjects {
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

  Subjects(
      {this.id,
      this.subjectId,
      this.subjectName,
      this.academicYearId,
      this.academicYearName,
      this.levelId,
      this.levelName,
      this.classId,
      this.className,
      this.groupName,
      this.semesterId,
      this.semesterName,
      this.schoolId,
      this.minAttandance,
      this.maxAttandance,
      this.startDate,
      this.endDate});

  Subjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subjectId'];
    subjectName = json['subjectName'];
    academicYearId = json['academicYearId'];
    academicYearName = json['academicYearName'];
    levelId = json['levelId'];
    levelName = json['levelName'];
    classId = json['classId'];
    className = json['className'];
    groupName = json['groupName'];
    semesterId = json['semesterId'];
    semesterName = json['semesterName'];
    schoolId = json['schoolId'];
    minAttandance = json['minAttandance'];
    maxAttandance = json['maxAttandance'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subjectId'] = subjectId;
    data['subjectName'] = subjectName;
    data['academicYearId'] = academicYearId;
    data['academicYearName'] = academicYearName;
    data['levelId'] = levelId;
    data['levelName'] = levelName;
    data['classId'] = classId;
    data['className'] = className;
    data['groupName'] = groupName;
    data['semesterId'] = semesterId;
    data['semesterName'] = semesterName;
    data['schoolId'] = schoolId;
    data['minAttandance'] = minAttandance;
    data['maxAttandance'] = maxAttandance;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    return data;
  }
}
