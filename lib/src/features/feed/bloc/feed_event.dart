import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {}

class LoadFeed extends FeedEvent {
  String token, category;
  LoadFeed(this.token, this.category);

  @override
  List<Object?> get props => [token, category];
}
