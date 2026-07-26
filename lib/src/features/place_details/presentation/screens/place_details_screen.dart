import 'package:flutter/material.dart';

import 'package:bookly/src/theme/app_colors.dart';

import '../widgets/widgets.dart';

/// Shared details screen used to showcase a single restaurant or hotel:
/// hero image, title/location, tabbed info sections and a bottom CTA bar.
class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({
    super.key,
    required this.placeId,
    required this.title,
    required this.location,
    this.rating = '9.5',
    this.aboutDescription,
    this.priceLabel,
    this.coverAsset,
    this.tabs = const ['About', 'Policy', 'Facilities', 'Location', 'Reviews'],
    this.secondaryIcon = Icons.room_service_outlined,
    this.secondaryLabel = 'Menu',
    this.onSecondaryTap,
    this.secondaryWidget,
    this.ctaIcon,
    this.ctaLabel = 'Book Table',
    this.onCtaTap,
    this.currentStep,
    this.totalSteps = 4,
  });

  /// Unique id used to scope this screen's tab-selection/favorite state.
  final String placeId;

  final String title;
  final String location;
  final String rating;
  final String? aboutDescription;
  final String? priceLabel;
  final String? coverAsset;
  final List<String> tabs;

  final IconData secondaryIcon;
  final String secondaryLabel;
  final VoidCallback? onSecondaryTap;
  final Widget? secondaryWidget;
  final IconData? ctaIcon;
  final String ctaLabel;
  final VoidCallback? onCtaTap;

  /// 1-based current step in a multi-step booking flow. When set, a step
  /// indicator is shown above the bottom bar.
  final int? currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Fixed hero — stays pinned while the content below scrolls.
          HeroSection(
            placeId: placeId,
            coverAsset: coverAsset,
            priceLabel: priceLabel,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleRow(title: title, rating: rating),
                  const SizedBox(height: 6),
                  LocationRow(location: location),
                  const SizedBox(height: 12),
                  PlaceDetailsTabBar(placeId: placeId, tabs: tabs),
                  const Divider(
                      height: 1, thickness: 1, color: AppColors.divider),
                  const SizedBox(height: 12),
                  PlaceDetailsTabContent(
                    placeId: placeId,
                    aboutDescription:
                        aboutDescription ?? const AboutSection().description,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          if (currentStep != null)
            StepIndicator(currentStep: currentStep!, totalSteps: 3),
          BottomBar(
            secondaryIcon: secondaryIcon,
            secondaryLabel: secondaryLabel,
            onSecondaryTap: onSecondaryTap,
            secondaryWidget: secondaryWidget,
            ctaIcon: ctaIcon,
            ctaLabel: ctaLabel,
            onCtaTap: onCtaTap,
          ),
        ],
      ),
    );
  }
}
