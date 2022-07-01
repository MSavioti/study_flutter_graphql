import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final Function(String) onSubmit;
  final String? initialValue;
  final TextEditingController? controller;

  const SearchTextField({
    Key? key,
    required this.onSubmit,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    controller.text = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white70,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.zero),
          borderSide: BorderSide(color: Colors.grey[900]!),
        ),
        fillColor: Colors.grey[800],
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
          borderSide: BorderSide(color: Colors.white70),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          child: Icon(
            Icons.search,
            size: 19.0,
            color: Colors.white70,
          ),
        ),
      ),
      style: const TextStyle(color: Colors.white70),
      onSubmitted: widget.onSubmit,
    );
  }
}
