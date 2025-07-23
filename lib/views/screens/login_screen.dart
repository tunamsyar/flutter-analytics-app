import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
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

                Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                    if (authProvider.isLoading) {
                      return const CircularProgressIndicator();
                    }

                    return Column(
                      children: [
                        SocialLoginButton(
                          icon: MdiIcons.google,
                          label: 'Continue with Google',
                          onPressed: () => _signInWithGoogle(context),
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
                          onPressed: () => _signInWithFacebook(context),
                          backgroundColor: const Color.fromARGB(255, 4, 9, 15),
                          textColor: Colors.white,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await context.read<AuthProvider>().signInWithGoogle();
    } catch (e) {
      _showErrorSnackBar(context, 'Google sign in failed');
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await context.read<AuthProvider>().signInWithFacebook();
    } catch (e) {
      _showErrorSnackBar(context, 'Facebook sign in failed');
    }
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

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
