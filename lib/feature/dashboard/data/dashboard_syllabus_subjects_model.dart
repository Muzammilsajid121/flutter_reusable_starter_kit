class DashboardSyllabusSubjectsModel {
  final String? subjectName;
  final String? code;
  final String? level;
  final String? description;
  final String? imageUrl;
  final int? totalTopics;
  final int? totalPastPapers;
  final int? totalMcqs;
  final int? solvedMcqs;
  final bool? isEnrolled;
  final String? id;

DashboardSyllabusSubjectsModel({this.subjectName, this.code, this.level, this.description, this.imageUrl, this.totalTopics, this.totalPastPapers, this.totalMcqs, this.solvedMcqs, this.isEnrolled, this.id});

factory DashboardSyllabusSubjectsModel.fromJson(Map<String, dynamic> json) => DashboardSyllabusSubjectsModel(
  subjectName: json['name'],
  code: json['code'],
  level: json['level'],
  description: json['description'],
  imageUrl: json['image_url'],
  totalTopics: json['total_topics'],
  totalPastPapers: json['total_past_papers'],
  totalMcqs: json['total_mcqs'],
  solvedMcqs: json['solved_mcqs'],
  isEnrolled: json['is_enrolled'],
  id: json['id'],
);

Map<String, dynamic> toJson() => {
  'name': subjectName,
  'code': code,
  'level': level,
  'description': description,
  'image_url': imageUrl,
  'total_topics': totalTopics,
  'total_past_papers': totalPastPapers,
  'total_mcqs': totalMcqs,
  'solved_mcqs': solvedMcqs,
  'is_enrolled': isEnrolled,
  'id': id,
};  


}
