import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:phone/bloc/button_bloc.dart';
import 'package:phone/bloc/button_event.dart';
import 'package:phone/bloc/button_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonBloc bloc = BlocProvider.of<ButtonBloc>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              bloc.add(ButtonChangesEvent(number: number.toString()));
            },
            maxLength: 10,
            selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<ButtonBloc, ButtonState>(
          builder: (BuildContext context, buttonState) {
        return FloatingActionButton(
          onPressed: () {
            if (buttonState is ButtonChangeState) {
              return _checkEnabled(buttonState.isEnabled);
            } else {
              null;
            }
          },
          child: const Icon(Icons.arrow_forward),
        );
      }),
    );
  }

  void _checkEnabled(bool isEnabled) {
    if (isEnabled) {
      return print('Button Pressed');
    } else {
      null;
    }
  }
}
