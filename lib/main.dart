import 'package:flew_travel/backend/blocs/user/user_bloc.dart';
import 'package/package.dart';

Future<void> main() async {
  //Settings Default
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Bloc Observer
  // Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flew Travel Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'OpenSans',
          textTheme: TextTheme(
            titleSmall: TextStyle(color: Colors.white),
          ),
        ).copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        //home: const ResponsiveLayout(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ResponsiveLayout(
                  webScreenLayout: WebLayout(),
                  mobileScreenLayout: MobileLayout(),
                );
                // return ExamplePage();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "${snapshot.error}",
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return WelcomePage();
          },
        ),
      ),
    );
  }
}
