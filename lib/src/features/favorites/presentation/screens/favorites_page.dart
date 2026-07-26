import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/generated/l10n.dart';

/// Placeholder tab root — favorited places/screenings aren't surfaced here yet.
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favoritesPageTitle),
        automaticallyImplyLeading: false,
      ),
      body: AppEmptyState(
        icon: Icons.favorite_border_rounded,
        title: S.of(context).favoritesEmptyTitle,
        subtitle: S.of(context).favoritesEmptySubtitle,
      ),
    );
  }
}