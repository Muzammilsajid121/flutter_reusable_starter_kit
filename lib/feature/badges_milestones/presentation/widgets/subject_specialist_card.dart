import 'package:flutter_starter_kit/common/buttons/reusable_loader_button.dart';
import 'package:flutter_starter_kit/utils/loaders_popup_progressbars/reusable_progressbar.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';

class SubjectSpecialistCard extends StatelessWidget {
  const SubjectSpecialistCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      // height: 140, 
      decoration: BoxDecoration(
        color: TColors.widgetbgpurewhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // symbol
              Container(
                height: 48, 
                width: 48,
                decoration: BoxDecoration(
                  color: const Color(0xffF0EDED),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text("Σ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
              const SizedBox(width: 16),
              
              // Text aur Progress Bar 
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Next Badge: Calculus Master".toUpperCase(),
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700,letterSpacing: 0.6,),
                        ),
                        Text(
                          "85%",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w900,color: const Color(0xffA08400),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const ReusableProgressBar(value: 0.85, height: 6),
                  ],
                ),
              ),
            ],
          ),
    
          SizedBox(height: 8,),
          
          // Go To Lessons Button
          ReusableLoaderButton(text: "GO TO LESSONS", onTap: () {}, fillColor: TColors.primaryYellow,),
          
          
        ],
      ),
    );
  }
}

