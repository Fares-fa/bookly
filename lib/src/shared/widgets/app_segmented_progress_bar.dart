import '../../imports/imports.dart';

/// A row of segmented, pill-shaped progress bars — e.g. for story-style
/// onboarding flows.
///
/// Segments before [currentIndex] render fully filled, the segment at
/// [currentIndex] fills left-to-right according to [progress] (0..1), and
/// segments after render empty.
///
/// Usage:
/// ```dart
/// AnimatedBuilder(
///   animation: progressController,
///   builder: (context, _) => AppSegmentedProgressBar(
///     segmentCount: pages.length,
///     currentIndex: currentPage,
///     progress: progressController.value,
///   ),
/// )
/// ```
class AppSegmentedProgressBar extends StatelessWidget {
  const AppSegmentedProgressBar({
    super.key,
    required this.segmentCount,
    required this.currentIndex,
    required this.progress,
    this.height = 4,
    this.gap = 6,
    this.trackColor = Colors.white,
    this.fillColor = const Color(0xFFE07E2E),
  });

  final int segmentCount;
  final int currentIndex;
  final double progress;
  final double height;
  final double gap;
  final Color trackColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(segmentCount, (index) {
        final segmentProgress = switch (index) {
          _ when index < currentIndex => 1.0,
          _ when index > currentIndex => 0.0,
          _ => progress.clamp(0.0, 1.0),
        };

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index == segmentCount - 1 ? 0 : gap),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(height / 2),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(height: height, color: trackColor),
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: segmentProgress,
                    child: Container(height: height, color: fillColor),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
