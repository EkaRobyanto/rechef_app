import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {}

// ignore: must_be_immutable
class LoadFeed extends FeedEvent {
  String category;
  LoadFeed([this.category = '']);

  @override
  List<Object?> get props => [category];
}
