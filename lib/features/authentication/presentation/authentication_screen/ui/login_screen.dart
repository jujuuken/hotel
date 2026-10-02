import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared_ui/widgets/app_scaffold.dart';
import '../../../../../shared_utils/extensions/extensions.dart';
import '../logic/authentication_bloc.dart';
import 'login/login_action.dart';
import 'login/login_controller.dart';
import 'login/login_form_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginAction {
  final _controller = LoginController();

  @override
  void initState() {
    super.initState();
    // Pre-fill email for development if needed, removing for production readiness
    // _controller.emailController.text = '1993';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticating: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AlertDialog(
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text('Logging in...'),
                ],
              ),
            ),
          ),
          authFailure: (message) {
            Navigator.of(context).pop(); // Dismiss loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 1500),
                content: Text('Login Failed: $message'),
                backgroundColor: Colors.redAccent,
              ),
            );
          },
          authenticated: () {
            Navigator.of(context).pop(); // Dismiss loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 1500),
                content: Text('Login Successful!'),
                backgroundColor: Colors.green,
              ),
            );
            // TODO: Navigate to home screen or dashboard
          },
          orElse: () => null,
        );
      },
      child: AppScaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogoHeader(),
                40.gap,
                Container(
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Selamat Datang',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      8.gap,
                      const Text(
                        'Masuk untuk mengakses dashboard',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      32.gap,
                      LoginFormSection(controller: _controller),
                      32.gap,
                      SizedBox(
                        height: 48,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF14B8A6),
                            foregroundColor: const Color(0xFF0F172A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () => onLoginPressed(context: context, controller: _controller),
                          icon: const Icon(Icons.login, size: 20),
                          label: const Text(
                            'Masuk',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                40.gap,
                const Text(
                  '© 2026 KadakaPMS. All rights reserved.',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }

  Widget _buildLogoHeader() {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: const Color(0xFF14B8A6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.home_outlined,
            color: Color(0xFF0F172A),
            size: 40,
          ),
        ),
        16.gap,
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: 'Kadaka', style: TextStyle(color: Colors.white)),
              TextSpan(text: 'PMS', style: TextStyle(color: Color(0xFF14B8A6))),
            ],
          ),
        ),
        8.gap,
        const Text(
          'HOTEL PROPERTY MANAGEMENT',
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 12,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}
