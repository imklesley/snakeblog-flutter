import 'package:blog_snake/controllers/stores/app_store.dart';
import 'package:blog_snake/controllers/stores/home_store.dart';
import 'package:blog_snake/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'config/constants.dart';
import 'controllers/stores/web_menu_store.dart';


//imklesley@gmail.com



void main() async {
  // Load environment variables
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>(
          create: (_) => AppStore(),
        ),
        Provider<WebMenuStore>(
          create: (_) => WebMenuStore(),
        ),
        Provider<HomeStore>(
          create: (_) => HomeStore(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BlogSnake',
        theme: ThemeData(
          // Para fazer os icones ativos da cor kPrimaryColor e o secondary para mudar a cor do over-scroll
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: kPrimaryColor)
              .copyWith(secondary: kPrimaryColor),

          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBgColor,
          fontFamily: 'Raleway',
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: kBodyTextColor),
            bodyText2: TextStyle(color: kBodyTextColor),
            headline5: TextStyle(color: kDarkBlackColor),
          ),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: kPrimaryColor),
        ),
        home: const HomeView(),
      ),
    );
  }
}

/*
flutter pub run build_runner build
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch
*
* */
