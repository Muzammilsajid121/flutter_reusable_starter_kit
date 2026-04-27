import 'dart:async';

import 'package:flutter_starter_kit/common/buttons/reusable_loader_button.dart';
import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_state.dart';
import 'package:flutter_starter_kit/feature/dashboard/logic/dashboard_cubit.dart';
import 'package:flutter_starter_kit/feature/dashboard/logic/dashboard_syllabus_subject_cubit.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Dashboard ka top hero card - Daily Goal + streak info + action buttons
class DailyGoalHeroCard extends StatefulWidget {
  const DailyGoalHeroCard({super.key});

  @override
  State<DailyGoalHeroCard> createState() => _DailyGoalHeroCardState();
}

class _DailyGoalHeroCardState extends State<DailyGoalHeroCard> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex++;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      decoration: BoxDecoration( 
        gradient: TColors.dashBoardGradient,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd), ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Daily Goal Chip
          const _DailyGoalChip(),

          const SizedBox(height: TSizes.defaultSpace),

          // -- Ready to crush your... Title
          BlocBuilder<DashboardSyllabusSubjectCubit, DashboardState>(
            builder: (context, subjectState) {
              String currentSubject = 'Physics';
              if (subjectState is DashboardSubjectsLoaded && subjectState.model.isNotEmpty) {
                final subjects = subjectState.model;
                final index = _currentIndex % subjects.length;
                currentSubject = subjects[index].subjectName ?? 'Physics';
              }
              
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: RichText(
                  key: ValueKey<String>(currentSubject),
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                    children: [
                      const TextSpan(text: 'Ready to crush your\n'),
                      TextSpan(
                        text: '$currentSubject goals\ntoday?', 
                        style: const TextStyle(color: TColors.primaryYellow),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: TSizes.sm),

          // -- you're on a 12 day Streak ...
          BlocSelector<DashboardCubit, DashboardState, DashboardState>(
            selector: (state) {
              return state;
            },
            builder: (context, state) {
              if(state is DashboardLoaded){
                final dashboardAnalyticsData = state.model;
                return Text( "You're on a ${dashboardAnalyticsData.currentStreak}-day streak! Keep the\nmomentum going to unlock the Scholar badge.",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(     color: TColors.widgetbgpurewhite.withOpacity(0.6),  height: 1.5,  ),
                      );
              }
              return SizedBox.shrink();
            },
          ),

          const SizedBox(height: TSizes.defaultSpace),

          // -- Action Buttons
          Row(
            children: [
              // Start Practice dynamic pass that subject that showing in hero card
              Expanded(
                child: ReusableLoaderButton(
                  onTap: () {
                    final subjectState = context.read<DashboardSyllabusSubjectCubit>().state;
                    if (subjectState is DashboardSubjectsLoaded && subjectState.model.isNotEmpty) {
                      final subjects = subjectState.model;
                      final index = _currentIndex % subjects.length;
                      final currentSubject = subjects[index];
                      
                      context.push(
                        TAppRouter.examStart,
                        extra: { 'subjectId': currentSubject.id, 'subjectName': currentSubject.subjectName, 'subjectCode': currentSubject.code,'level': currentSubject.level, },
                      );
                    }
                  },
                  imagePath: TImages.startPractice,
                  horizontalPadding: 4,
                  isImageIconOnLeft: true,
                  spacingBetweenTextImage: 1,
                  text: 'Start Practice',
                  fillColor: TColors.primaryYellow,
                ),
              ),

              const SizedBox(width: TSizes.sm),

              //view history button
              Expanded(child: ReusableLoaderButton( 
                  onTap: () {
                    final subjectState = context.read<DashboardSyllabusSubjectCubit>().state;
                    if (subjectState is DashboardSubjectsLoaded && subjectState.model.isNotEmpty) {
                      final subjects = subjectState.model;
                      final index = _currentIndex % subjects.length;
                      final currentSubject = subjects[index];
                      
                      context.push(
                        TAppRouter.examStart,
                        extra: { 'subjectId': currentSubject.id, 'subjectName': currentSubject.subjectName, 'subjectCode': currentSubject.code,'level': currentSubject.level, },
                      );
                    }
                  },
                imagePath: TImages.viewHistory, imageHeight: 11, imageWidth: 11, isImageIconOnLeft: true,   text: 'View History', fillColor: TColors.transparent,spacingBetweenTextImage: 3,  horizontalPadding: 4, borderColor: TColors.widgetbgpurewhite.withOpacity(0.2), isShowBorder: true, textColor: TColors.widgetbgpurewhite, )),
      
            ],
          ),
        ],
      ),
    );
  }
}



// --Daily Goal label chip
class _DailyGoalChip extends StatelessWidget {
  const _DailyGoalChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(color: Color(0xffFFFFFF).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const Icon(Iconsax.flash_11, color: TColors.primaryYellow, size: TSizes.iconSm),
            const SizedBox(width: TSizes.xs),
            Text(   'DAILY GOAL: 15/20 MCQS', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: TColors.widgetbgpurewhite,    ),),
          ],
        ),
      ),
    );
  }
}
