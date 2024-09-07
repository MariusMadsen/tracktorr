import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laruina/pages/redirects/auth_page.dart';
import 'package:laruina/provider/comics_provider.dart';
import 'package:laruina/provider/events_provider.dart';
import 'package:laruina/provider/friends_model.dart';
import 'package:laruina/provider/games_model.dart';
import 'package:laruina/provider/manga_provider.dart';
import 'package:laruina/provider/movie_person_model.dart';
import 'package:laruina/provider/movies_model.dart';
import 'package:laruina/provider/mtg_model.dart';
import 'package:laruina/provider/single_comic_model.dart';
import 'package:laruina/provider/single_game_model.dart';
import 'package:laruina/provider/single_movie_model.dart';
import 'package:laruina/provider/statistic_provider.dart';
import 'package:laruina/statics/colors.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await StreamingSharedPreferences.instance;
  final settings = MyAppSettings(preferences);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StatisticModel()),
        ChangeNotifierProvider(create: (_) => EventModel()),
        ChangeNotifierProvider(create: (_) => MangaModel()),
        ChangeNotifierProvider(create: (_) => MoviesModel()),
        ChangeNotifierProvider(create: (_) => SingleMovieModel()),
        ChangeNotifierProvider(create: (_) => MoviePersonModel()),
        ChangeNotifierProvider(create: (_) => ComicsModel()),
        ChangeNotifierProvider(create: (_) => SingleComicModel()),
        ChangeNotifierProvider(create: (_) => GamesModel()),
        ChangeNotifierProvider(create: (_) => FriendsModel()),
        ChangeNotifierProvider(create: (_) => SingleGameModel()),
        ChangeNotifierProvider(create: (_) => MtgModel()),
      ],
      child: MyApp(settings: settings),
    ),
  );
}

class MyAppSettings {
  MyAppSettings(StreamingSharedPreferences preferences)
      : user = preferences.getString('user', defaultValue: "");

  final Preference<String> user;
}

class SystemUiMatch extends StatelessWidget {
  const SystemUiMatch({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: Colors.black,
          statusBarColor: ThemeColors.backGround(),
          systemNavigationBarDividerColor: ThemeColors.accent()),
      child: child,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settings});
  final MyAppSettings settings;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Theme.of(context).primaryColor,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 35, 2, 92),
            primary: ThemeColors.backGround()),
        textTheme: GoogleFonts.notoSansTextTheme().copyWith(
            bodyMedium: const TextStyle(color: Colors.white, fontSize: 16)),
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: ThemeColors.accent()),
        useMaterial3: true,
      ),
      home: SystemUiMatch(child: AuthPage(settings: settings)),
    );
  }
}
