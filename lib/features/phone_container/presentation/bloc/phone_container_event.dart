part of 'phone_container_bloc.dart';

abstract class PhoneContainerEvent extends Equatable {
  const PhoneContainerEvent();

  @override
  List<Object> get props => [];
}

class PhoneAnimationStartEvent extends PhoneContainerEvent {}

class PhoneAnimationEndEvent extends PhoneContainerEvent {}

class ShowAdditionalContactInfoEvent extends PhoneContainerEvent {}

class ShowProfessionalCategoriesEvent extends PhoneContainerEvent {
  int category;
  ShowProfessionalCategoriesEvent({required this.category});
}
