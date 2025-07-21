import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../widgets/buttons/social_login_button.dart';
import 'home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.chartLine,
                  size: 120,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  'Analytics Dashboard',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Track your business performance with beautiful charts and insights',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 48),
                Column(
                  children: [
                    SocialLoginButton(
                      icon: MdiIcons.google,
                      label: 'Continue with Google',
                      onPressed: () => _simulateLogin(context, 'Google'),
                      backgroundColor: Colors.white,
                      textColor: Colors.black87,
                    ),
                    const SizedBox(height: 16),
                    SocialLoginButton(
                      icon: MdiIcons.apple,
                      label: 'Continue with Apple',
                      onPressed: () => _simulateLogin(context, 'Apple'),
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    SocialLoginButton(
                      icon: MdiIcons.facebook,
                      label: 'Continue with Facebook',
                      onPressed: () => _simulateLogin(context, 'Facebook'),
                      backgroundColor: const Color(0xFF1877F2),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _simulateLogin(BuildContext context, String method) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Logging in with $method...')));
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }
}
