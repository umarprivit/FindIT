import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required String? Function(String?) validator,
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    String? hintText,
    bool canRequestFocus = true,
    Widget? trailingIcon,
  })  : _validator = validator,
        _label = label,
        _controller = controller,
        _obscureText = obscureText,
        _hintText = hintText,
        _canRequestFocus = canRequestFocus,
        _trailingIcon = trailingIcon;

  final String? Function(String?) _validator;
  final String _label;
  final TextEditingController _controller;
  final bool _obscureText;
  final String? _hintText;
  final bool _canRequestFocus;
  final Widget? _trailingIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: _validator,
      controller: _controller,
      obscureText: _obscureText,
      canRequestFocus: _canRequestFocus,
      decoration: InputDecoration(
        label: Text(_label),
        hintText: _hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: _trailingIcon,
      ),
    );
  }
}
