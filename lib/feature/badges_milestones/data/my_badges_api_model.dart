class MyBadgesModel {
  final int? totalEarnedBages;
  final int? totalBadges;
  final List<BadgesDetails>? badges;

MyBadgesModel({this.totalEarnedBages, this.totalBadges, this.badges});

factory MyBadgesModel.fromJson(Map<String, dynamic> json) => MyBadgesModel(
  totalEarnedBages: json['total_earned'],
  totalBadges: json['total_badges'],
  badges: json['badges'] != null
            ? (json['badges'] as List).map((i) => BadgesDetails.fromJson(i)).toList()
            : null,
);

Map<String, dynamic> toJson() => {
  'total_earned': totalEarnedBages,
  'total_badges': totalBadges,
  'badges': badges?.map((e) => e.toJson()).toList(),
};  
}


//--Badges Details Model
class BadgesDetails {
  final String? badgeId;
  final String? name;
  final String? description;
  final String? iconUrl;
  final String? conditionType;
  final bool? isEarned;
  final String? earnedAt;


BadgesDetails({this.badgeId, this.name, this.description, this.iconUrl, this.conditionType, this.isEarned, this.earnedAt});

factory BadgesDetails.fromJson(Map<String, dynamic> json) => BadgesDetails(
  badgeId: json['badge_id'],
  name: json['name'],
  description: json['description'],
  iconUrl: json['icon_url'],
  conditionType: json['condition_type'],
  isEarned: json['is_earned'],
  earnedAt: json['earned_at'],
);

Map<String, dynamic> toJson() => {
  'badge_id': badgeId,
  'name': name,
  'description': description,
  'icon_url': iconUrl,
  'condition_type': conditionType,
  'is_earned': isEarned,
  'earned_at': earnedAt,
};  

}

 
