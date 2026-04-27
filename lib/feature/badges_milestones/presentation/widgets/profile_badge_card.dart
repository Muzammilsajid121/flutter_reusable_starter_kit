
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter/cupertino.dart';

class ProfileBadgeCard extends StatelessWidget {
  final int totalBadges, earnedBadges;
  const ProfileBadgeCard({super.key, required this.totalBadges, required this.earnedBadges});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
       color: TColors.widgetbgpurewhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [

              //--Image card of 44x60
              Container(
                height: 60,
                width: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffE5E2E1), width: 2),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://i.pravatar.cc/150?img=3"), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              //-- Name + Subtitle + level badge
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                      Text("Alex Johnson",  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
                      
                      //-- Level Badge
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          spacing: 4,
                          children: [
                            Icon(CupertinoIcons.star_circle_fill, size: 16),
                            Text("LVL 14", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
            
                      ],
                    ),
                    SizedBox(height: 4),
                    Text("DIGITAL EXPLORER & CODE NINJA",  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54)),
                  ],
                ),
              ),

            ],
          ),

          const SizedBox(height: 16),

          //-- Streak + Badges
          Row(
            children:  [
              const BadgesChip(icon: Icons.local_fire_department, text: "12 - DAY STREAK"),
              const SizedBox(width: 12),
              BadgesChip(icon: Icons.emoji_events, text: "$earnedBadges/$totalBadges BADGES"),
            ],
          )
        ],
      ),
    );
  }
}




class BadgesChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const BadgesChip({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:  EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xffF6F3F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
