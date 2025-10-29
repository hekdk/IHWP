import 'package:flutter/material.dart';
import 'package:ihwp/providers/auth_provider.dart';
import 'package:ihwp/screens/questionnaire/questionnaire_screen.dart';
import 'package:ihwp/utils/app_theme.dart';
import 'package:ihwp/widgets/custom_button.dart';
import 'package:ihwp/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      bool success = await authProvider.signup(
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
      );

      if (success && mounted) {
        // New user, navigate to questionnaire
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => QuestionnaireScreen()),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? 'Sign up failed'),
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
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Join Us!',
                  style: AppTheme.heading1,
                ),
                SizedBox(height: 8),
                Text(
                  'Start your wellness journey today',
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
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email_outlined,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter an email';
                    if (!value.contains('@')) return 'Enter a valid email';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter a password';
                    if (value.length < 6)
                      return 'Password must be at least 6 characters';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please confirm password';
                    if (value != _passwordController.text)
                      return 'Passwords do not match';
                    return null;
                  },
                ),
                SizedBox(height: 32),
                authProvider.isLoading
                    ? CircularProgressIndicator()
                    : CustomButton(
                        text: 'Sign Up',
                        onPressed: _handleSignUp,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
