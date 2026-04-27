import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_state.dart';
import 'package:flutter_starter_kit/feature/dashboard/logic/dashboard_cubit.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Recommended Practice section - based on mistakes
class RecommendedPracticeSection extends StatelessWidget {
  const RecommendedPracticeSection({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Screen Rebuild RecommendedPracticeSection');
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if(state is DashboardLoading){
          return const TShimmerEffect(height: 100, width: double.infinity,); 
        }
        if(state is DashboardLoaded){
          final topics = state.model.recommendedTopics ?? [];
          // final dashboardAnalyticsData = state.model;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Section Header recommended practive based on mistakes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Recommended Practice', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),),
                Text( 'BASED ON MISTAKES', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: TColors.darkBrown4F4,  letterSpacing: 0.9, fontSize: 9 ),
                ),
              ],
            ),
    
            const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),

            // -- Dynamic Practice Items (Using Column + Map)
              Column(
                children: topics.map((topic) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: TSizes.defaultSpaceBtwItem),
                    child: RecommendedPracticeItem(
                      image: topic.subjectName == 'Accounting' 
                          ? TImages.newtonBulbBlue 
                          : TImages.orgChemMicroscope,
                      topicName: topic.topicTitle ?? 'Untitled Topic',
                      subjectTag: topic.subjectName?.toUpperCase() ?? 'GENERAL',
                      totalQuestions: topic.totalQuestions ?? 0,
                      estimatedMins: 15, 
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        
    
      }
      else{
        return const SizedBox.shrink();
      }
    }
    );
  }
}



//-- Single Recommended Practice row item — reusable / Newtons second law widget
class RecommendedPracticeItem extends StatelessWidget {
  final String image;
  final String topicName;
  final String subjectTag;
  final int totalQuestions;
  final int estimatedMins;

  const RecommendedPracticeItem({
    super.key,
    required this.image,
    required this.topicName,
    required this.subjectTag,
    required this.totalQuestions,
    required this.estimatedMins,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.md,
        vertical: TSizes.defaultSpaceBtwItem,
      ),
      decoration: BoxDecoration(
        color: TColors.widgetbgpurewhite,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      ),
      child: Row(
        children: [
          // -- Subject icon
          Container(
            height: 44,
            width: 44,
            padding: const EdgeInsets.all(TSizes.sm),
            decoration: BoxDecoration(color: Color(0xffEFF6FF),  shape: BoxShape.circle,  ),
            child: Image.asset(image),
          ),

          const SizedBox(width: TSizes.defaultMoreSpaceBtwItem),

          // -- Topic info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( topicName, style: Theme.of(context).textTheme.bodyMedium!.copyWith( fontWeight: FontWeight.bold, ),  ),
                const SizedBox(height: TSizes.xs),
                Text( '$subjectTag  •  $totalQuestions QUESTIONS  • ~$estimatedMins MINS',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: TColors.darkBrown4F4,  letterSpacing: -0.25,
                      ),
                ),
              ],
            ),
          ),

          // -- Arrow
          const Icon(Icons.arrow_forward_ios, size: TSizes.iconSm,  color: Color(0xffD1D5DB) ),
        ],
      ),
    );
  }
}
