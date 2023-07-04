import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddFirstCredential extends RegisterEvent {
  final Map<String, dynamic> data;

  AddFirstCredential(this.data);
}

class SelectGender extends RegisterEvent {
  final String gender;

  SelectGender(this.gender);
}

class AddInterest extends RegisterEvent {
  final String interest;

  AddInterest(this.interest);
}

class RemoveInterest extends RegisterEvent {
  final String interest;

  RemoveInterest(this.interest);
}

class SubmitRegistration extends RegisterEvent {}
