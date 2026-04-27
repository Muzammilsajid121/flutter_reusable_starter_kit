import 'package:flutter_starter_kit/feature/badges_milestones/data/badges_state.dart';
import 'package:flutter_starter_kit/feature/badges_milestones/logic/my_badges_cubit.dart';
import 'package:flutter_starter_kit/feature/badges_milestones/presentation/widgets/badge_card_single.dart';
import 'package:flutter_starter_kit/feature/badges_milestones/presentation/widgets/profile_badge_card.dart';
import 'package:flutter_starter_kit/feature/badges_milestones/presentation/widgets/subject_specialist_card.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BadgesMilestoneScreen extends StatelessWidget {
  const BadgesMilestoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("BadgesMilestoneScreen API CALLING::::::::::::::::::::::::::::::::::::::::");
    //-- no need to call api here because it is already called in dashboard screen
    return Scaffold(
      appBar: AppBar(
        title: const Text("Badges & Milestones"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
        ],
      ),
      backgroundColor: TColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<MyBadgesCubit, BadgesState>(
            builder: (context, state) {
              if(state is BadgesLoading){
                return const Center(child: CircularProgressIndicator());
              }
              if(state is BadgesError){
                return Center(child: Text(state.message));
              }
              if(state is MyBadgesLoaded){
                final myBadges = state.model;
                return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
          
                        //-- Profile Card
                        ProfileBadgeCard(totalBadges: myBadges.totalBadges ?? 0, earnedBadges: myBadges.totalEarnedBages ?? 0),
                        const SizedBox(height: 24),
          
                        //-- Exam Milestones
                        const _SectionTitle(title: "Exam Milestones"),
                        const SizedBox(height: 24),
                        _gridSection([
                          ...myBadges.badges!.map((badge) => BadgeCardSingle(badge.name!, badge.iconUrl!, badge.isEarned!)),
                        ]),
          
                        const SizedBox(height: 24),
          
                        //-- Consistency
                        const _SectionTitle(title: "Consistency"),
                        const SizedBox(height: 12),
                        // _gridSection([
                        //   BadgeCardSingle("Streak Master", Icons.speed, true),
                        //   BadgeCardSingle("Night Owl", Icons.nightlight, false),
                        //   BadgeCardSingle("Monthly Hero", Icons.calendar_month, false),
                        //   BadgeCardSingle("Early Bird", Icons.wb_sunny, false),
                        // ]),
          
            
                        //-- subject specialist
                        const SizedBox(height: 48),
                        const _SectionTitle(title: "Subject Specialist"),
                        const SizedBox(height: 24),
                        SubjectSpecialistCard()
          
          
                      ],
                    );
            };
            return const Center(child: Text("No Badges Found"));
            }
          ),
        ),
      ),
    );
  }



  //-- Grid Layout
  Widget _gridSection(List<BadgeCardSingle> items) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (_, index) => items[index],
    );
  }


}



//--section title
class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -1.2)),
        const SizedBox(height: 4),
        Container(
          width: 30,
          height: 4,
          color: Colors.amber,
        )
      ],
    );
  }
}
