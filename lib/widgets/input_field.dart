// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// class InputField extends StatefulWidget {
//   final String hintText;
//   final TextEditingController controller;
//   const InputField({super.key, required this.hintText, required this.controller});
//
//   @override
//   State<InputField> createState() => _InputFieldState();
// }
//
// class _InputFieldState extends State<InputField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         fillColor: Colors.white54,
//         filled: true,
//         hintText:widget.hintText,
//           border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//       )
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const InputField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.hintText.toLowerCase() == 'password' ? _isObscured : false,
      onChanged: (text) {},
      decoration: InputDecoration(
        fillColor: Colors.white54,
        filled: true,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: widget.hintText.toLowerCase() == 'password'
            ? IconButton(
          icon: _isObscured
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        )
            : null,
      ),
    );
  }
}
