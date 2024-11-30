import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyPinput extends StatelessWidget {
  const MyPinput(
      {super.key,
      required TextEditingController controller,
      required void Function(String?) onCompleted,
      required String? Function(String?) validator})
      : _controller = controller,
        _onCompleted = onCompleted,
        _validator = validator;
  final TextEditingController _controller;
  final void Function(String?) _onCompleted;
  final String? Function(String?) _validator;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: _controller,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      keyboardType: TextInputType.number,
      onCompleted: _onCompleted,
      validator: _validator,
      defaultPinTheme: PinTheme(
        width: 50,
        height: 50,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
