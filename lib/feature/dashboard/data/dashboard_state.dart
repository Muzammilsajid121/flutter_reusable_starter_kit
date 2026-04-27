import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_analytics_model.dart';
import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_syllabus_subjects_model.dart';
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}
class DashboardLoading extends DashboardState {}

// Is state mein hum data pass karenge
class DashboardLoaded extends DashboardState {
  final DashboardAnalyticsModel model;
  DashboardLoaded(this.model);
}


//-- dashboard subject states 
class DashboardSubjectLoading extends DashboardState {}

class DashboardSubjectsLoaded extends DashboardState {
  final List<DashboardSyllabusSubjectsModel> model;
  DashboardSubjectsLoaded(this.model);
}


class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}
