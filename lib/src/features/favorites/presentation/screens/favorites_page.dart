import 'package:bookly/src/imports/imports.dart';

/// Placeholder tab root — favorited places/screenings aren't surfaced here yet.
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite'), automaticallyImplyLeading: false),
      body: const AppEmptyState(
        icon: Icons.favorite_border_rounded,
        title: 'No favorites yet',
        subtitle: 'Places and screenings you favorite will show up here.',
      ),
    );
  }
}