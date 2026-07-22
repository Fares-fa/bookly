import '../../imports/imports.dart';

import 'package:bookly/src/features/home/domain/entities/live_screening.dart';
import 'package:bookly/src/features/home/presentation/providers/home_providers.dart';

/// "Live Match Screenings" card section. Defaults to Home's data, but
/// [title] and [provider] can both be overridden so other screens can reuse
/// the same section with different data.
class LiveScreeningsSection extends StatelessWidget {
  const LiveScreeningsSection({
    super.key,
    this.title = 'Live Match Screenings',
    this.provider,
  });

  final String title;
  final FutureProvider<List<LiveScreening>>? provider;

  @override
  Widget build(BuildContext context) {
    return AsyncCardSection<LiveScreening>(
      title: title,
      provider: provider ?? liveScreeningsProvider,
      emptyTitle: 'No live screenings right now',
      errorMessage: 'Could not load live screenings',
      cardWidth: 150,
      listHeight: 180,
      itemBuilder: (context, screening, width) => LiveScreeningCard(screening: screening, width: width),
    );
  }
}