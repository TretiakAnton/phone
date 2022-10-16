abstract class ButtonEvent {}

class ButtonChangesEvent extends ButtonEvent {
  ButtonChangesEvent({required this.number});

  String number;
}
