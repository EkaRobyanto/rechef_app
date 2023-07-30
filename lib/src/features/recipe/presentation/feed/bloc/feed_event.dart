import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {}

class LoadFeed extends FeedEvent {
  String category;
  LoadFeed([this.category = '']);

  @override
  List<Object?> get props => [category];
}
