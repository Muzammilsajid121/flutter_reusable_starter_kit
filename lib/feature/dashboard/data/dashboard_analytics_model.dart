class DashboardAnalyticsModel {
  final int? currentStreak;
  final int? longestStreak;
  final double? successRate;
  final double? avgTimePerQuestion;
  final double? totalTimeSeconds;
  final int? totalQuestionsSolved;
  final int? totalAttempts;
  final List<RecommendedTopics>? recommendedTopics;

DashboardAnalyticsModel({this.currentStreak, this.longestStreak, this.successRate, this.avgTimePerQuestion, this.totalTimeSeconds, this.totalQuestionsSolved, this.totalAttempts, this.recommendedTopics});

factory DashboardAnalyticsModel.fromJson(Map<String, dynamic> json) => DashboardAnalyticsModel(
  currentStreak: json['current_streak'],
  longestStreak: json['longest_streak'],
  successRate: json['success_rate']?.toDouble(),
  avgTimePerQuestion: json['avg_time_per_question']?.toDouble(),
  totalTimeSeconds: json['total_time_seconds']?.toDouble(),
  totalQuestionsSolved: json['total_questions_solved'],
  totalAttempts: json['total_attempts'],
  recommendedTopics: json['recommended_topics'] != null
            ? (json['recommended_topics'] as List).map((i) => RecommendedTopics.fromJson(i)).toList()
            : null,
);

Map<String, dynamic> toJson() => {
  'current_streak': currentStreak,
  'longest_streak': longestStreak,
  'success_rate': successRate,
  'avg_time_per_question': avgTimePerQuestion,
  'total_time_seconds': totalTimeSeconds,
  'total_questions_solved': totalQuestionsSolved,
  'total_attempts': totalAttempts,
  'recommended_topics': recommendedTopics?.map((e) => e.toJson()).toList(),
};  
}





class RecommendedTopics {
  final String? topicId;
  final String? topicTitle;
  final String? subjectId;
  final String? subjectName;
  final double? accuracy;
  final int? totalQuestions;
  final String? reason;

RecommendedTopics({this.topicId, this.topicTitle, this.subjectId, this.subjectName, this.accuracy, this.totalQuestions, this.reason});

factory RecommendedTopics.fromJson(Map<String, dynamic> json) => RecommendedTopics(
  topicId: json['topic_id'],
  topicTitle: json['topic_title'],
  subjectId: json['subject_id'],
  subjectName: json['subject_name'],
  accuracy: json['accuracy']?.toDouble(),
  totalQuestions: json['total_questions'],
  reason: json['reason'],
);

Map<String, dynamic> toJson() => {
  'topic_id': topicId,
  'topic_title': topicTitle,
  'subject_id': subjectId,
  'subject_name': subjectName,
  'accuracy': accuracy,
  'total_questions': totalQuestions,
  'reason': reason,
};  

}

 
