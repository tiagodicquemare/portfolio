part of 'phone_container_bloc.dart';

abstract class PhoneContainerState extends Equatable {
  const PhoneContainerState();

  @override
  List<Object> get props => [];
}

class PhoneContainerInitial extends PhoneContainerState {}

class PhoneAnimationOngoing extends PhoneContainerState {}

class ShowScreenshotState extends PhoneContainerState {
  final List<String> screenshots;

  ShowScreenshotState(this.screenshots);

  @override
  List<Object> get props => [screenshots];
}
