import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/features/complete_info/presentation/widgets/interest_option.dart';

class InterestsStep extends StatelessWidget {
  const InterestsStep({
    super.key,
    required this.tt,
    required this.interests,
    required this.selectedInterests,
    required this.onToggleInterest,
  });

  final TextTheme tt;
  final List<({String label, String emoji})> interests;
  final Set<String> selectedInterests;
  final ValueChanged<String> onToggleInterest;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose Your Interests',
            style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w600)),
        const Text('Get specific about things you love'),
        SizedBox(height: 24.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: [
            for (final interest in interests)
              InterestOption(
                label: interest.label,
                emoji: interest.emoji,
                selected: selectedInterests.contains(interest.label),
                onTap: () => onToggleInterest(interest.label),
              ),
          ],
        ),
      ],
    );
  }
}
