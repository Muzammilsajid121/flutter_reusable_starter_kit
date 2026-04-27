import 'package:flutter_starter_kit/common/shimmer/dummy_shimmer_screen.dart';
import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_state.dart';
import 'package:flutter_starter_kit/feature/dashboard/logic/dashboard_cubit.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//-- Stats section in dashboard - current streak, questions, time, accuracy
class DashboardStatsSection extends StatelessWidget {
  const DashboardStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Screen Rebuild DashboardStatsSection');

    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if(state is DashboardLoading){
          return DummyScreenShimmer();
        }
        if(state is DashboardError){
          return Center(child: Text(state.message),);
        }
        if(state is DashboardLoaded){
          final dashboardAnalyticsData = state.model;

          return Column(
          children: [
            // -- Row 1: Streak + Questions Solved
            Row(
              children: [
                Expanded(
                  child: _StatTile(
                    image: TImages.currentStreakFire,
                    label: 'CURRENT STREAK',
                    mainValue: dashboardAnalyticsData.currentStreak.toString(),
                    unit: 'Days',
                  ),
                ),
                const SizedBox(width: TSizes.md),
                Expanded(
                  child: _StatTile(
                    image: TImages.questionsSolvedTick,
                    label: 'QUESTIONS SOLVED',
                    mainValue: dashboardAnalyticsData.totalQuestionsSolved.toString(),
                    unit: '',
                  ),
                ),
              ],
            ),
    
            const SizedBox(height: TSizes.md),
    
            // -- Row 2: Time Spent + Avg Accuracy
            Row(
              children: [
                Expanded(
                  child: _StatTile(
                    image: TImages.timeSpent,
                    label: 'TIME SPENT',
                    mainValue: dashboardAnalyticsData.avgTimePerQuestion.toString(),
                    unit: '',
                  ),
                ),

                const SizedBox(width: TSizes.md),
                Expanded(
                  child: _StatTile(
                    image: TImages.avgAccuracy,
                    label: 'AVG. ACCURACY',
                    mainValue: dashboardAnalyticsData.successRate.toString(),
                    unit: '%',
                  ),
                ),
              ],
            ),
          ],
        );
      }
      else{
        return Center(child: Text("Something went wrong"),);
      }
      }
    );
  }
}



// -- Individual stat tile (streak, questions, accuracy)
class _StatTile extends StatelessWidget {
  final String image;
  final String label;
  final String mainValue;
  final String unit;

  const _StatTile({
    required this.image,
    required this.label,
    required this.mainValue,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSizes.md),
      decoration: BoxDecoration(
        color: TColors.widgetbgwhitepale,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Icon + label
          Row(
            children: [
              Image.asset(image, height: TSizes.iconSm),
              const SizedBox(width: TSizes.xs),
              Text(label,style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Color(0xff4F4633),letterSpacing: -0.25,),),
            ],
          ),

          const SizedBox(height: TSizes.xs),

          // -- Value
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleSmall,
              children: [
                TextSpan(text: mainValue),
                if (unit.isNotEmpty)
                  TextSpan(
                    text: ' $unit',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Color(0xff4F4633), fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
