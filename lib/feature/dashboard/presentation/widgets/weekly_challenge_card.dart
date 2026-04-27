import 'package:flutter_starter_kit/common/buttons/reusable_loader_button.dart';
// import 'package:flutter_starter_kit/feature/leaderboard/data/leaderboard_state.dart';
// import 'package:flutter_starter_kit/feature/leaderboard/logic/leaderboard_specific_student_cubit.dart';
// import 'package:flutter_starter_kit/naivgation_menu.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

/// Weekly Challenge dark card at the bottom of dashboard
class WeeklyChallengeCard extends StatelessWidget {
  const WeeklyChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(TSizes.lg),
      decoration: BoxDecoration(
        gradient: TColors.linearGaradient,
        // color: TColors.blackWidgetbg, //! gradient aiga
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -- Top label trophy and weekly challenge text
                Row(
                  children: [
                    Image.asset(TImages.weeklyChallengeTrophy),
                    const SizedBox(width: TSizes.xs),
                    Text('WEEKLY CHALLENGE',style: Theme.of(context).textTheme.displaySmall!.copyWith( color: TColors.widgetbgpurewhite, letterSpacing: 1.8, ),
                    ),
                  ],
                ),
      
                const SizedBox(height: TSizes.defaultSpace),
      
                // -- Title
                Text( 'Top 10% of Students', style: Theme.of(context).textTheme.titleSmall!.copyWith(  color: Colors.white,  ), ),
      
                const SizedBox(height: TSizes.xs),
      
                // -- Description
                Text( "You're solving questions faster than 90% of\nyour peers this week. Keep it up to earn the\nGolden Trophy!", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: TColors.greyWidgetbg, height: 1.5,       ),  ),
      
                const SizedBox(height: TSizes.defaultSpace),
      
                // -- View Leaderboard Button
                ReusableLoaderButton(
                  text: 'View Leaderboard', fillColor: TColors.primaryYellow,
                  //to switch custom nav bar tab
                  onTap: () {  /* CustomNavBar.switchToTab(2); */    },
                ),
              ],
            )
    );
  }
}
