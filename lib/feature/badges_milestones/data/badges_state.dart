import 'package:flutter_starter_kit/feature/badges_milestones/data/my_badges_api_model.dart';
abstract class BadgesState {}

class BadgesInitial extends BadgesState {}
class BadgesLoading extends BadgesState {}

class BadgesError extends BadgesState {
  final String message;
  BadgesError(this.message);
}

//-- my badges states
// Is state mein hum data pass karenge
class MyBadgesLoaded extends BadgesState {
  final MyBadgesModel model;
  MyBadgesLoaded(this.model);
}
  

