import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'components/main_screen.dart';
import 'components/password_screen.dart';
import 'components/side_button.dart';
import 'helpers/api.dart';

void main() {
  usePathUrlStrategy();
  runApp(const ScoreboardApp());
}

class ScoreboardApp extends HookWidget {
  const ScoreboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    final password = useState<String?>(null);
    debugPrint(Uri.base.queryParameters.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(background: Colors.transparent),
        primarySwatch: Colors.blue,
        fontFamily: 'Work Sans',
      ),
      initialRoute: '/?lesson_id=x',
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (context) => password.value == null
            ? PasswordScreen(onSubmit: (pass) => password.value = pass)
            : MainScreen(
                password: password.value!,
                lessonId: Uri.base.queryParameters["lesson_id"]!,
              ),
      ),
    );
  }
}
