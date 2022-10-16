abstract class ButtonState {}

class ButtonChangeState extends ButtonState {
  ButtonChangeState({required this.isEnabled});

  bool isEnabled;
}
