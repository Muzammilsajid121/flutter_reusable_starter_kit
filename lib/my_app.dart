
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_kit/feature/auth/logic/auth_cubit.dart';
import 'package:flutter_starter_kit/feature/dashboard/logic/dashboard_cubit.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/utils/theme/theme.dart';
import 'package:flutter_starter_kit/utils/theme/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //all blocs here
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(),),
        BlocProvider(create: (context) => DashboardCubit(),),
        BlocProvider(create: (context) => ThemeCubit(),),
      ],

      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'STARTER KIT BY MUZAMMIL',
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            themeMode: themeMode,
            theme: TAppTheme.lightTheme,
            darkTheme: TAppTheme.darkTheme,
            // telling app to start app from this point
            routerConfig: TAppRouter.router,
            builder: (context, child) {
              //safe area color
              return Container(
                color: themeMode == ThemeMode.dark ? TColors.widgetbakgroundPureDark : TColors.widgetbgpurewhite,
                child: SafeArea(
                  bottom: false,
                  child: child!,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
    