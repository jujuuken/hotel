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

    _controller.emailController.text = '1993';
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
                duration: Duration(milliseconds: 150),
                content: Text('Login Failed: $message'),
                backgroundColor: Colors.redAccent,
              ),
            );
          },
          authenticated: () {
            Navigator.of(context).pop(); // Dismiss loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 150),
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Login Screen', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                32.gap,
                LoginFormSection(controller: _controller),
                32.gap,
                ElevatedButton(
                  onPressed: () => onLoginPressed(context: context, controller: _controller),
                  child: const Text('Login'),
                ),
                32.gap,
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  buildWhen: (previous, current) => current.maybeWhen(
                    authenticating: () => true,
                    authFailure: (message) => true,
                    authenticated: () => true,
                    orElse: () => false,
                  ),
                  builder: (context, state) {
                    return state.maybeWhen(
                      authenticating: () => const Text('Authenticating...'),
                      authenticated: () => const Text('Authenticated!'),
                      authFailure: (message) => Text('Error: $message'),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
