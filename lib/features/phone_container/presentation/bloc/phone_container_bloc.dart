import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'phone_container_event.dart';
part 'phone_container_state.dart';

@injectable
class PhoneContainerBloc
    extends Bloc<PhoneContainerEvent, PhoneContainerState> {
  PhoneContainerBloc() : super(PhoneContainerInitial()) {
    on<ScreenshotChosenEvent>((event, emit) {
      // emit(ShowScreenshotState(event.screenshots));
    });
    on<PhoneAnimationStartEvent>((event, emit) {
      emit(PhoneAnimationOngoing());
    });
    on<PhoneAnimationEndEvent>((event, emit) {
      emit(PhoneContainerInitial());
    });
  }
}
