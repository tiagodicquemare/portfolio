part of 'phone_container_bloc.dart';

abstract class PhoneContainerEvent extends Equatable {
  const PhoneContainerEvent();

  @override
  List<Object> get props => [];
}

class PhoneAnimationStartEvent extends PhoneContainerEvent {}

class PhoneAnimationEndEvent extends PhoneContainerEvent {}

class ScreenshotChosenEvent extends PhoneContainerEvent {
  final List<String> screenshots;

  ScreenshotChosenEvent(this.screenshots);

  @override
  List<Object> get props => [screenshots];
}
