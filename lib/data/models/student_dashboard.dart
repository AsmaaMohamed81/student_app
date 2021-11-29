import 'dart:convert';

StudentDashboard studentDashboardFromJson(String str) =>
    StudentDashboard.fromJson(json.decode(str));

String studentDashboardToJson(StudentDashboard data) =>
    json.encode(data.toJson());

class StudentDashboard {
  StudentDashboard({
    this.studentInformation,
    this.dailyLectures,
    this.exams,
    this.assignments,
    this.subjects,
  });

  StudentInformation? studentInformation;
  List<DailyLecture>? dailyLectures;
  List<Exam>? exams;
  List<Assignment>? assignments;
  List<Subject>? subjects;

  factory StudentDashboard.fromJson(Map<String, dynamic> json) =>
      StudentDashboard(
        studentInformation:
            StudentInformation.fromJson(json["studentInformation"]),
        dailyLectures: List<DailyLecture>.from(
            json["dailyLectures"].map((x) => DailyLecture.fromJson(x))),
        exams: List<Exam>.from(json["exams"].map((x) => Exam.fromJson(x))),
        assignments: List<Assignment>.from(
            json["assignments"].map((x) => Assignment.fromJson(x))),
        subjects: List<Subject>.from(
            json["subjects"].map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "studentInformation": studentInformation!.toJson(),
        "dailyLectures":
            List<dynamic>.from(dailyLectures!.map((x) => x.toJson())),
        "exams": List<dynamic>.from(exams!.map((x) => x.toJson())),
        "assignments": List<dynamic>.from(assignments!.map((x) => x.toJson())),
        "subjects": List<dynamic>.from(subjects!.map((x) => x.toJson())),
      };
}

class Assignment {
  Assignment({
    this.id,
    this.courseGroupId,
    this.courseAssignmentId,
    this.assignmentCode,
    this.assignmentText,
    this.assignmentFile,
    this.assignmentDegree,
    this.assignmentDueDate,
    this.materialName,
  });

  int? id;
  int? courseGroupId;
  int? courseAssignmentId;
  String? assignmentCode;
  String? assignmentText;
  List<String>? assignmentFile;
  double? assignmentDegree;
  DateTime? assignmentDueDate;
  String? materialName;

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"],
        courseGroupId: json["courseGroupId"],
        courseAssignmentId: json["courseAssignmentId"],
        assignmentCode: json["assignmentCode"],
        assignmentText: json["assignmentText"],
        assignmentFile: List<String>.from(json["assignmentFile"].map((x) => x)),
        assignmentDegree: json["assignmentDegree"],
        assignmentDueDate: DateTime.parse(json["assignmentDueDate"]),
        materialName: json["materialName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "courseGroupId": courseGroupId,
        "courseAssignmentId": courseAssignmentId,
        "assignmentCode": assignmentCode,
        "assignmentText": assignmentText,
        "assignmentFile": List<dynamic>.from(assignmentFile!.map((x) => x)),
        "assignmentDegree": assignmentDegree,
        "assignmentDueDate": assignmentDueDate!.toIso8601String(),
        "materialName": materialName,
      };
}

class DailyLecture {
  DailyLecture({
    this.id,
    this.courseId,
    this.lectureNumber,
    this.peroidDescription,
    this.fromTime,
    this.toTime,
    this.isBreakTime,
    this.dayId,
    this.dayName,
    this.subjectName,
    this.className,
    this.levelName,
    this.studentsCount,
    this.percentage,
    this.relatedLectureNumber,
    this.isLectureOpened,
    this.meeting,
  });

  int? id;
  int? courseId;
  int? lectureNumber;
  String? peroidDescription;
  String? fromTime;
  String? toTime;
  bool? isBreakTime;
  int? dayId;
  String? dayName;
  String? subjectName;
  String? className;
  String? levelName;
  int? studentsCount;
  double? percentage;
  int? relatedLectureNumber;
  bool? isLectureOpened;
  String? meeting;

  factory DailyLecture.fromJson(Map<String, dynamic> json) => DailyLecture(
        id: json["id"],
        courseId: json["courseId"],
        lectureNumber: json["lectureNumber"],
        peroidDescription: json["peroidDescription"],
        fromTime: json["fromTime"],
        toTime: json["toTime"],
        isBreakTime: json["isBreakTime"],
        dayId: json["dayId"],
        dayName: json["dayName"],
        subjectName: json["subjectName"],
        className: json["className"],
        levelName: json["levelName"],
        studentsCount: json["studentsCount"],
        percentage: json["percentage"].toDouble(),
        relatedLectureNumber: json["relatedLectureNumber"],
        isLectureOpened: json["isLectureOpened"],
        meeting: json["meeting"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "courseId": courseId,
        "lectureNumber": lectureNumber,
        "peroidDescription": peroidDescription,
        "fromTime": fromTime,
        "toTime": toTime,
        "isBreakTime": isBreakTime,
        "dayId": dayId,
        "dayName": dayName,
        "subjectName": subjectName,
        "className": className,
        "levelName": levelName,
        "studentsCount": studentsCount,
        "percentage": percentage,
        "relatedLectureNumber": relatedLectureNumber,
        "isLectureOpened": isLectureOpened,
        "meeting": meeting,
      };
}

class Exam {
  Exam({
    this.id,
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
    this.createdDate,
  });

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
  DateTime? createdDate;

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        isDisplay: json["isDisplay"],
        percentageToSuccess: json["percentageToSuccess"],
        studentMultiAnswar: json["studentMultiAnswar"],
        minutes: json["minutes"],
        isRandom: json["isRandom"],
        isSomeNumber: json["isSomeNumber"],
        numberQuestionDisplay: json["numberQuestionDisplay"],
        isFinalExam: json["isFinalExam"],
        courseModuleId: json["courseModuleId"],
        courseModuleName: json["courseModuleName"],
        courseId: json["courseId"],
        organizationId: json["organizationId"],
        courseName: json["courseName"],
        catalogCourseName: json["catalogCourseName"],
        createdDate: DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "isDisplay": isDisplay,
        "percentageToSuccess": percentageToSuccess,
        "studentMultiAnswar": studentMultiAnswar,
        "minutes": minutes,
        "isRandom": isRandom,
        "isSomeNumber": isSomeNumber,
        "numberQuestionDisplay": numberQuestionDisplay,
        "isFinalExam": isFinalExam,
        "courseModuleId": courseModuleId,
        "courseModuleName": courseModuleName,
        "courseId": courseId,
        "organizationId": organizationId,
        "courseName": courseName,
        "catalogCourseName": catalogCourseName,
        "createdDate": createdDate!.toIso8601String(),
      };
}

class StudentInformation {
  StudentInformation({
    this.id,
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
    this.schoolId,
  });

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

  factory StudentInformation.fromJson(Map<String, dynamic> json) =>
      StudentInformation(
        id: json["id"],
        userId: json["userId"],
        name: json["name"],
        photo: json["photo"],
        classId: json["classId"],
        className: json["className"],
        levelId: json["levelId"],
        levelName: json["levelName"],
        semesterId: json["semesterId"],
        semesterName: json["semesterName"],
        academicYearId: json["academicYearId"],
        academicYearName: json["academicYearName"],
        schoolId: json["schoolId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "name": name,
        "photo": photo,
        "classId": classId,
        "className": className,
        "levelId": levelId,
        "levelName": levelName,
        "semesterId": semesterId,
        "semesterName": semesterName,
        "academicYearId": academicYearId,
        "academicYearName": academicYearName,
        "schoolId": schoolId,
      };
}

class Subject {
  Subject({
    this.id,
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
    this.endDate,
  });

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
  DateTime? startDate;
  DateTime? endDate;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        subjectId: json["subjectId"],
        subjectName: json["subjectName"],
        academicYearId: json["academicYearId"],
        academicYearName: json["academicYearName"],
        levelId: json["levelId"],
        levelName: json["levelName"],
        classId: json["classId"],
        className: json["className"],
        groupName: json["groupName"],
        semesterId: json["semesterId"],
        semesterName: json["semesterName"],
        schoolId: json["schoolId"],
        minAttandance: json["minAttandance"],
        maxAttandance: json["maxAttandance"],
        // startDate: DateTime.parse(json["startDate"]),
        // endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subjectId": subjectId,
        "subjectName": subjectName,
        "academicYearId": academicYearId,
        "academicYearName": academicYearName,
        "levelId": levelId,
        "levelName": levelName,
        "classId": classId,
        "className": className,
        "groupName": groupName,
        "semesterId": semesterId,
        "semesterName": semesterName,
        "schoolId": schoolId,
        "minAttandance": minAttandance,
        "maxAttandance": maxAttandance,
        "startDate": startDate!.toIso8601String(),
        "endDate": endDate!.toIso8601String(),
      };
}
