import 'package:equatable/equatable.dart';

/// A live match/event screening with a limited number of seats.
class LiveScreening extends Equatable {
  final String id;
  final String title;
  final String imageAsset;
  final int seatsLeft;

  const LiveScreening({
    required this.id,
    required this.title,
    required this.imageAsset,
    required this.seatsLeft,
  });

  @override
  List<Object?> get props => [id, title, imageAsset, seatsLeft];
}