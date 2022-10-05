import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String text) onChanged;
  final String? Function(dynamic value) validator;

  const InputText({
    Key? key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  TextFormField(
          keyboardType: this.keyboardType,
          obscureText: this.obscureText,
          onChanged: this.onChanged,
          validator: this.validator,
          enableInteractiveSelection: false,
          autofocus: true,
          decoration: InputDecoration(
            hintText: this.label,
            labelText: this.label,
            suffixIcon: const Icon(
                Icons.verified_user
            ),
            labelStyle: const TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w500
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          )
    );

  }
}
