import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone/bloc/button_event.dart';
import 'package:phone/bloc/button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonChangeState(isEnabled: false));

  @override
  Stream<ButtonState> mapEventToState(ButtonEvent event) async* {
    if (event is ButtonChangesEvent) {
      bool isEnabledButton;
      if (event.number.length == 10) {
        isEnabledButton = true;
      } else {
        isEnabledButton = false;
      }
      yield ButtonChangeState(isEnabled: isEnabledButton);
    }
  }
}
