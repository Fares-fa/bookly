import 'package:bookly/src/imports/imports.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final current = _buildMaterialApp(context);
    return ScreenUtilWrapper(child: current);
  }

  Widget _buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      title: 'bookly',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(primaryColorHex: '#0042D3'),
      // darkTheme: buildDarkTheme(primaryColorHex: '#0042D3'),
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        Widget current = child!;
        current = SkeletonWrapper(child: current);
        current = SessionListenerWrapper(child: current);
        current = DevicePreview.appBuilder(context, current);
        return current;
      },
    );
  }
}
