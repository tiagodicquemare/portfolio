import 'package:dicquemare_solution/NavigationRoutes.dart';
import 'package:dicquemare_solution/core/injection.dart';
import 'package:dicquemare_solution/features/home/presentation/pages/home_page.dart';
import 'package:dicquemare_solution/languages/app_localizations_delegate.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  debugPaintSizeEnabled = false;
  debugDisableShadows = false;
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
            navigatorKey: NavigationService.navigatorKey,
            scrollBehavior: AppScrollBehavior(),
            title: 'Dicquemare Solution',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Nunito',
              primaryColor: Colors.blueGrey.shade700,
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: Colors.blueGrey.shade700),
            ),
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('fr'),
              Locale('en'),
            ],
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(),
              NavigationRoutes.home: (context) => HomePage(),
            }));
  }
}
