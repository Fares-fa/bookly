import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/more/presentation/providers/locale_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = _buildMaterialApp(context, ref);
    return ScreenUtilWrapper(child: current);
  }

  Widget _buildMaterialApp(BuildContext context, WidgetRef ref) {
    final locale = DevicePreview.locale(context) ?? ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'bookly',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(primaryColorHex: '#0042D3'),
      // darkTheme: buildDarkTheme(primaryColorHex: '#0042D3'),
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
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
