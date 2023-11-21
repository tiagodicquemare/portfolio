part of 'phone_container_bloc.dart';

abstract class PhoneContainerState extends Equatable {
  const PhoneContainerState();

  @override
  List<Object> get props => [];
}

class PhoneContainerInitial extends PhoneContainerState {}

class PhoneAnimationOngoing extends PhoneContainerState {}

class ShowProfessionalCategoriesState extends PhoneContainerState {
  final int category;
  ShowProfessionalCategoriesState({required this.category});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShowProfessionalCategoriesState &&
        other.category == category;
  }

  @override
  int get hashCode => category.hashCode;
}
