import 'package:flutter/material.dart';
import 'package:ihwp/providers/auth_provider.dart';
import 'package:ihwp/providers/exercise_provider.dart';
import 'package:ihwp/providers/prakruti_provider.dart';
import 'package:ihwp/screens/auth/login_screen.dart';
import 'package:ihwp/screens/home/home_screen.dart';
import 'package:ihwp/services/database_service.dart';
import 'package:ihwp/utils/app_theme.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize services
  final databaseService = DatabaseService();
  await databaseService.initDB();

  final authProvider = AuthProvider(databaseService);
  await authProvider.loadUserSession(); // Check if user is already logged in

  runApp(
    MyApp(
      databaseService: databaseService,
      authProvider: authProvider,
    ),
  );
}

class MyApp extends StatelessWidget {
  final DatabaseService databaseService;
  final AuthProvider authProvider;

  const MyApp({
    Key? key,
    required this.databaseService,
    required this.authProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider(
          create: (context) => PrakrutiProvider(
            databaseService,
            authProvider, // Pass authProvider
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ExerciseProvider(
            databaseService,
            authProvider, // Pass authProvider
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Prakruti Health',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: Consumer<AuthProvider>(
          builder: (context, auth, _) {
            if (auth.currentUser != null) {
              // If user is logged in, check if they have filled the form
              final prakrutiProvider = Provider.of<PrakrutiProvider>(context, listen: false);
              prakrutiProvider.loadPrakrutiResult(); // Try to load result
              
              final exerciseProvider = Provider.of<ExerciseProvider>(context, listen: false);
              exerciseProvider.loadCompletedExercises(); // Load today's log

              return HomeScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
