import 'package:flutter_starter_kit/common/appbar/reusable_appbar_badge.dart';
import 'package:flutter_starter_kit/feature/badges_milestones/logic/my_badges_cubit.dart';
import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_state.dart';
import 'package:flutter_starter_kit/feature/dashboard/logic/dashboard_cubit.dart';
import 'package:flutter_starter_kit/feature/dashboard/logic/dashboard_syllabus_subject_cubit.dart';
import 'package:flutter_starter_kit/feature/dashboard/presentation/widgets/daily_goal_hero_card.dart';
import 'package:flutter_starter_kit/feature/dashboard/presentation/widgets/recommended_practice_section.dart';
import 'package:flutter_starter_kit/feature/dashboard/presentation/widgets/stats_row.dart';
import 'package:flutter_starter_kit/feature/dashboard/presentation/widgets/subject_readiness_section.dart';
import 'package:flutter_starter_kit/feature/dashboard/presentation/widgets/weekly_challenge_card.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  //--api call
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().fetchDashboardAnalytics();
    context.read<DashboardSyllabusSubjectCubit>().fetchDashboardSubjects();
    //--badges api call to load early
    context.read<MyBadgesCubit>().fetchMyBadges();

  }
  
  @override
  Widget build(BuildContext context) {
    debugPrint('Screen Rebuild DashboardScreen');
    return Scaffold(
      backgroundColor: TColors.backgroundColor,

      // -- AppBar
      appBar: AppBar(
        //*MENU BUTTON
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.black),
          offset: const Offset(0, 40),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onSelected: (value) {
            // if (value == 'profile') {
            //   context.push(TAppRouter.profile);
            // }
            //  else 
            if (value == 'Analytics') {
              context.push(TAppRouter.analyticscreen);
            }
             else if (value == 'setting') {
              context.push(TAppRouter.setting);
            } else if (value == 'badges') {
              context.push(TAppRouter.badgesMilestone);
            } else if (value == 'appCheck') {
              context.push(TAppRouter.appCheck);
            }
          },
          itemBuilder: (context) => [
            // const PopupMenuItem(
            //   value: 'profile',
            //   child: Row(
            //     children: [
            //       Icon(Icons.person_outline, color: TColors.black),
            //       SizedBox(width: 12),
            //       Text('Profile'),
            //     ],
            //   ),
            // ),
            const PopupMenuItem(
              value: 'Analytics',
              child: Row(
                children: [
                  Icon(Icons.analytics, color: TColors.black),
                  SizedBox(width: 12),
                  Text('Analytics'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'setting',
              child: Row(
                children: [
                  Icon(Icons.settings_outlined, color: TColors.black),
                  SizedBox(width: 12),
                  Text('Settings'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'badges',
              child: Row(
                children: [
                  Icon(Icons.emoji_events_outlined, color: TColors.black),
                  SizedBox(width: 12),
                  Text('Badges & Milestones'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'appCheck',
              child: Row(
                children: [
                  Icon(Icons.widgets_outlined, color: TColors.black),
                  SizedBox(width: 12),
                  Text('App Check (UI Kit)'),
                ],
              ),
            ),
          ],
        ),
        elevation: 0,
        actions: [
       
          // -- Container fire streaks days
          ReusableAppBarBadge(
            child:  Row(
                children: [
                  InkWell(
                    onTap: () { // context.push(TAppRouter.examStart);
                    },
                    child: Image.asset(TImages.currentStreakFire)),
                    SizedBox(width: TSizes.sm,),
                    BlocBuilder<DashboardCubit, DashboardState>(
                      builder: (context, state) {
                        if(state is DashboardLoaded){
                          return Text( state.model.currentStreak.toString(),   style: Theme.of(context).textTheme.displaySmall );
                        }
                        return Text( '12',   style: Theme.of(context).textTheme.displaySmall );
                      },
                    ),
                ],
              ),
          ),
        
    
          // -- Notification bell
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active, color: Colors.black),
          ),

        ],
      ),

      // -- Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md,vertical: TSizes.defaultSpaceBtwItem,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: TSizes.defaultSpace),


            // ── 1. Hero Card (Daily Goal + Actions)
            const DailyGoalHeroCard(),

            const SizedBox(height: TSizes.defaultSpace),

            // ── 2. Stats Row (Streak, Questions, Time, Accuracy)
            const DashboardStatsSection(),

            const SizedBox(height: TSizes.defaultSpace),

            // ── 3. Subject Readiness
            const SubjectReadinessSection(),

            const SizedBox(height: TSizes.defaultSpace),

            // ── 4. Recommended Practice
            const RecommendedPracticeSection(),

            const SizedBox(height: TSizes.defaultSpace),

            // ── 5. Weekly Challenge
            const WeeklyChallengeCard(),

            const SizedBox(height: TSizes.defaultSpace),

            // ── 6. Footer
            Center(child: Text('© 2025 LUMINA ACADEMY. KEEP LEARNING',  style: Theme.of(context).textTheme.displaySmall!.copyWith(  color: TColors.greyWidgetbg, letterSpacing: 1,)),),

            const SizedBox(height: TSizes.defaultSpace),
          ],
        ),
      ),
    );
  }
}



