import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/utils/local_storage/storage_utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  //--timer for splash screen
  void initState(){
    super.initState();
    final isOpenedFirstTime = TLocalStorage().readData<bool>('isOpenedfirstTime') ?? false;

    if (isOpenedFirstTime) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkLoginStatus();
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        _checkLoginStatus();
      });
    }
  }

  //-- Check if user already logged in
  void _checkLoginStatus() {
    final accessToken = TLocalStorage().readData<String>('access_token');
    if (accessToken != null && accessToken.isNotEmpty) {
      // Token exists → direct dashboard
      context.go(TAppRouter.customNavBar);
    } else {
      // No token → direct to login flow (Skipping onboarding)
      // context.go(TAppRouter.onboarding);
      context.go(TAppRouter.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: TSizes.defaultSpaceBtwSection,),
          Spacer(),
          Column(
            children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: TColors.primaryYellow,
              ),
              height: 128,
              width: 128,
              child: Image.asset( TImages.splashScreenBulb),
            ),
          SizedBox(height: TSizes.defaultSpaceBtwSection,),
          Row(
              mainAxisAlignment: .center,
              children: [
              Text('Lumina ', style: Theme.of(context).textTheme.displayLarge),
              Text('Academy', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: TColors.textBrownColor),),
            ],),

            SizedBox(height: TSizes.defaultSpaceBtwSection,),
            Text('THE PEAK OF', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold, letterSpacing: 3.5, color:Color(0xff4F4633)),),
            SizedBox(height: TSizes.defaultSpaceBtwItem,),
            Text('INTELLIGENCE', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold, letterSpacing: 3.5, color:Color(0xff4F4633)),),

            ],
          ),
        
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpaceBtwSection),
              child: 
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                Text('INITIALIZING...', style: Theme.of(context).textTheme.displaySmall!.copyWith(color:TColors.textBrownColor,  letterSpacing: 2.5),),
                Text('V2.4.0', style: Theme.of(context).textTheme.displaySmall!.copyWith(letterSpacing: 2.5, color:TColors.textBrownColor, ),),
              ],
            ),
            ),
            SizedBox(height: TSizes.defaultSpaceBtwSection,),

            
          ],
        ),
      
    );
  }
}
