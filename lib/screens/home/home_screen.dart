import 'package:flutter/material.dart';
import 'package:ihwp/providers/auth_provider.dart';
import 'package:ihwp/screens/auth/login_screen.dart';
import 'package:ihwp/screens/home/tabs/dashboard_tab.dart';
import 'package:ihwp/screens/home/tabs/diet_tab.dart';
import 'package:ihwp/screens/home/tabs/exercise_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Prakruti Health'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home_filled), text: 'Home'),
              Tab(icon: Icon(Icons.restaurant_menu), text: 'Diet'),
              Tab(icon: Icon(Icons.self_improvement), text: 'Exercise'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DashboardTab(),
            DietTab(),
            ExerciseTab(),
          ],
        ),
      ),
    );
  }
}
