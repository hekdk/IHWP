import 'package:flutter/material.dart';
import 'package:ihwp/providers/auth_provider.dart';
import 'package:ihwp/providers/exercise_provider.dart';
import 'package:ihwp/providers/prakruti_provider.dart';
import 'package:ihwp/screens/auth/signup_screen.dart';
import 'package:ihwp/screens/home/home_screen.dart';
import 'package:ihwp/utils/app_theme.dart';
import 'package:ihwp/widgets/custom_button.dart';
import 'package:ihwp/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      bool success = await authProvider.login(
        _usernameController.text,
        _passwordController.text,
      );

      if (success && mounted) {
        // Load data *after* successful login
        final prakrutiProvider = Provider.of<PrakrutiProvider>(context, listen: false);
        await prakrutiProvider.loadPrakrutiResult();
        
        final exerciseProvider = Provider.of<ExerciseProvider>(context, listen: false);
        await exerciseProvider.loadCompletedExercises();

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid username or password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back!',
                    style: AppTheme.heading1,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Log in to your health journey',
                    style: AppTheme.bodyText.copyWith(fontSize: 18),
                  ),
                  SizedBox(height: 40),
                  CustomTextField(
                    controller: _usernameController,
                    labelText: 'Username',
                    icon: Icons.person_outline,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a username' : null,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a password' : null,
                  ),
                  SizedBox(height: 32),
                  authProvider.isLoading
                      ? CircularProgressIndicator()
                      : CustomButton(
                          text: 'Login',
                          onPressed: _handleLogin,
                        ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: AppTheme.bodyText,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignUpScreen()),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: AppTheme.bodyText.copyWith(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
