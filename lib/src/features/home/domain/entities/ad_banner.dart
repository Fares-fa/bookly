import 'package:equatable/equatable.dart';

/// A single ad banner shown in the Home carousel.
class AdBanner extends Equatable {
  final String id;
  final String title;
  final String highlight;
  final String subtitle;
  final String ctaLabel;
  final String imageAsset;

  const AdBanner({
    required this.id,
    required this.title,
    required this.highlight,
    required this.subtitle,
    required this.ctaLabel,
    required this.imageAsset,
  });

  @override
  List<Object?> get props => [id, title, highlight, subtitle, ctaLabel, imageAsset];
}