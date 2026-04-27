import 'package:flutter_starter_kit/apis/dio_helper.dart';
import 'package:flutter_starter_kit/feature/badges_milestones/data/my_badges_api_model.dart';

class BadgesRepository {
  //-- get my badges || header m auto token add ho jayega from dio class
  Future<MyBadgesModel> getMyBadges() async {
    try {
      final response = await TDioHelper.get('student/badge/my-badges');
      // Response data ko model mein convert
      return MyBadgesModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }



}
