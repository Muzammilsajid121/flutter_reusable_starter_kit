import 'package:flutter_starter_kit/common/buttons/reusable_loader_button.dart';
import 'package:flutter_starter_kit/utils/loaders_popup_progressbars/reusable_progressbar.dart';
import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_state.dart';
import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_syllabus_subjects_model.dart';
import 'package:flutter_starter_kit/feature/dashboard/logic/dashboard_syllabus_subject_cubit.dart';
// import 'package:flutter_starter_kit/naivgation_menu.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Subject Readiness section with horizontal scrollable subject cards
class SubjectReadinessSection extends StatelessWidget {
  const SubjectReadinessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardSyllabusSubjectCubit, DashboardState>(
      builder: (context, state) {
        if(state is DashboardSubjectLoading){
          return const Center(child: TShimmerEffect(width: 100, height: 100,));
        }
        if(state is DashboardSubjectsLoaded){
          final dashboardSubjects = state.model;
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
              //1st row with container and subject readiness
              Row(
                children: [
                  //yellow container
                    Container(
                      width: 6, height:24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: TColors.primaryYellow
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Text('Subject Readiness', style: Theme.of(context).textTheme.bodyLarge!.copyWith(letterSpacing: -0.25), ),
              
                ],
              ),
       
                //view all button
                GestureDetector(
                  onTap: () {
                    // CustomNavBar.switchToTab(1);
                  },
                  child: Row(
                    children: [
                      Text('VIEW ALL',  style: Theme.of(context).textTheme.displaySmall!.copyWith(  color: TColors.darkBrown4F4,),  ),
                      const SizedBox(width: TSizes.xs),
                      Image.asset(TImages.arrowRight, height: 8, width:8) 
                     
                    ],
                  ),
                )
              ],
            ),
    
            const SizedBox(height: TSizes.defaultSpaceBtwItem),
    
            // -- Horizontal Scrollable Cards
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 12,
                children: List.generate(dashboardSubjects.length, (index) {
                  final subject = dashboardSubjects[index];
                  return SubjectReadinessCard(
                    subjectName: "${subject.subjectName} (${subject.code})",
                    topicSummary: "Forces, Kinematics, Electricity",
                    masteryPercent: (subject.totalMcqs ?? 0) == 0   ? 0.0    : (subject.solvedMcqs ?? 0) / (subject.totalMcqs ?? 1),
                    badgeText: subject.level ?? '',
                    badgeColor: TColors.primaryYellow,
                    badgeTextColor: TColors.darkBrown4F4,
                    subjectImage: TImages.physics,
                    onTapContinue: () {
                      context.push(TAppRouter.examStart, extra: {
                        'subjectId': subject.id,
                        'subjectName': subject.subjectName,
                        'subjectCode': subject.code,
                        'level': subject.level,
                      });
                    },
                  );
                }),



             
            ),
            )
          ],
        );
      }
      else{
        return const SizedBox.shrink();
      }
    }
    );
  }

  void calculateMasteryPercent(DashboardSyllabusSubjectsModel subject) {
    
  } 
}



//-- Single Subject Card — reusable
class SubjectReadinessCard extends StatelessWidget {
  final String subjectName;
  final String topicSummary;
  final double masteryPercent;       // 0.0 to 1.0
  final String badgeText;
  final Color badgeColor;
  final Color badgeTextColor;
  final String subjectImage;
  final VoidCallback onTapContinue;

  const SubjectReadinessCard({
    super.key,
    required this.subjectName,
    required this.topicSummary,
    required this.masteryPercent,
    required this.badgeText,
    required this.badgeColor,
    required this.badgeTextColor,
    required this.subjectImage,
    required this.onTapContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288, height: 259,
      padding: const EdgeInsets.all(TSizes.md),
      decoration: BoxDecoration(
        color: TColors.widgetbgpurewhite,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Badge + Icon Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              //-- Subject Icon in yellow container
              Container(
                height: 40, width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,color: TColors.primaryYellow.withOpacity(0.2)
                ),
                child: Image.asset(subjectImage),
              ),
              
              //-- Badge Exam ready
              Container(
                padding: const EdgeInsets.symmetric( horizontal: TSizes.md,vertical: TSizes.sm, ),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text( badgeText, style: Theme.of(context).textTheme.displaySmall!.copyWith(color: badgeTextColor, letterSpacing: 0.45,), ),
              ),

            ],
          ),

          const SizedBox(height: TSizes.sm),

          // -- Subject Name
          Text(  subjectName, style: Theme.of(context).textTheme.bodyLarge,),

          // -- Topics summary
          Text(topicSummary, style: Theme.of(context).textTheme.bodySmall!.copyWith( color: TColors.darkBrown4F4, ),),

          const SizedBox(height: 20),

          // -- Mastery Label + Percent
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mastery Level', style: Theme.of(context).textTheme.displaySmall!.copyWith( color: TColors.darkBrown4F4,),  ),
              Text('${(masteryPercent * 100).toInt()}%', style: Theme.of(context).textTheme.displaySmall!.copyWith( color: TColors.darkBrown4F4,),  ),
           
            ],
          ),

          const SizedBox(height: TSizes.sm),

          // -- Progress Bar
          ReusableProgressBar(value: masteryPercent),
         

          const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),

          // -- Continue Button
          ReusableLoaderButton(
              text: 'Continue',
              icon: Icons.arrow_forward,
              borderRadius: 12,
              onTap: onTapContinue,
          ),
          
              
        ],
      ),
    );
  }
}
