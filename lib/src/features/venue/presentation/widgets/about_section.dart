import 'package:bookly/src/imports/imports.dart';

/// "About" heading, description paragraph and a "See more" action.
class VenueAboutSection extends StatelessWidget {
  const VenueAboutSection({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About', style: AppTextStyle.blackW500Size17),
        const SizedBox(height: 14),
        Text(text, style: AppTextStyle.blackW400Size14),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {},
          child: Text(
            'See more',
            style: AppTextStyle.blackW400Size14
                .copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
