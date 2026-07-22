import 'package:bookly/src/imports/imports.dart';

/// Placeholder tab root — settings/account/support menu isn't built yet.
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More'), automaticallyImplyLeading: false),
      body: const AppEmptyState(
        icon: Icons.grid_view_rounded,
        title: 'More is on its way',
        subtitle: 'Settings, support, and account options will live here.',
      ),
    );
  }
}