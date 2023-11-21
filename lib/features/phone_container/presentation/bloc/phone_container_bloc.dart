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
      print('Bloc state emit ${event.category}');
      emit(ShowProfessionalCategoriesState(category: event.category));
    });
    on<PhoneAnimationStartEvent>((event, emit) {
      emit(PhoneAnimationOngoing());
    });
    on<PhoneAnimationEndEvent>((event, emit) {
      emit(PhoneContainerInitial());
    });
  }
}
