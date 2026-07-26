import 'src/imports/core_imports.dart';
import 'src/imports/packages_imports.dart';
import 'src/app.dart';


Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  await dotenv.load(fileName: '.env');
  
  await AppConfig.init();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const StateWrapper(
        child: App(),
      ),
    ),
  );
}