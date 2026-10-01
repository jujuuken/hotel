import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/helpers/secure_storage/secure_storage_helper.dart';
import 'core/helpers/shared_preference/preference_helper.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initServiceLocator();
  await PrefHelper.init();
  await SecureStorageHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => sl<AuthenticationBloc>(),
        // ),
      ],
      child: App(),
    );
  }
}
