import 'package:flutter_starter_kit/apis/dio_helper.dart';
import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_analytics_model.dart';
import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_syllabus_subjects_model.dart';

class DashboardRepository {
  //-- get dashboard analytics records || header m auto token add ho jayega from dio class
  Future<DashboardAnalyticsModel> getDashboardAnalyticsRecords() async {
    try {
      final response = await TDioHelper.get('student/auth/dashboard/analytics');
      // Response data ko model mein convert
      return DashboardAnalyticsModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }


  //-- get dashboard subjects records || usually give 5 subjects details || *list return horhi hai
  Future<List<DashboardSyllabusSubjectsModel>> getDashboardSubjectsRecords() async {
    try {
      final response = await TDioHelper.get('student/syllabus/subjects');
      // Response data ko model mein convert
      return (response.data as List) .map((e) => DashboardSyllabusSubjectsModel.fromJson(e))  .toList();
    } catch (e) {
      rethrow;
    }
  }



}
