import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/navigation/presentation/pages/navigation_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  void sendApiKeyToNative() {
    final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
    const platform = MethodChannel('com.example.moniepoint_test/apiKey');
    platform.invokeMethod('setApiKey', {'apiKey': apiKey});
  }
  await dotenv.load();
  sendApiKeyToNative();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Euclid Circular A',
            useMaterial3: false,
            appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light)),
        home:  const NavigationBarComponent(),
      ),
    );
  }
}

