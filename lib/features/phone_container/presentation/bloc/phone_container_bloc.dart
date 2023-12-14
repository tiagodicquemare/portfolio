import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'phone_container_event.dart';
part 'phone_container_state.dart';

@injectable
class PhoneContainerBloc
    extends Bloc<PhoneContainerEvent, PhoneContainerState> {
  PhoneContainerBloc() : super(PhoneContainerInitial()) {
    on<ShowProfessionalCategoriesEvent>((event, emit) {
      emit(ShowProfessionalCategoriesState(category: event.category));
    });
    on<ShowAdditionalContactInfoEvent>((event, emit) {
      emit(ShowAdditionalContactInfoState());
    });
    on<PhoneAnimationStartEvent>((event, emit) {
      emit(PhoneAnimationOngoing());
    });
    on<PhoneAnimationEndEvent>((event, emit) {
      emit(PhoneContainerInitial());
    });
  }
}
