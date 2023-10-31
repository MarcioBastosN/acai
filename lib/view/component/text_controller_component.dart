import 'package:flutter/material.dart';

class MyCustonText extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType inputType;
  final int maxLength;
  final IconData? perfixIcon;
  final void Function()? submit;
  final FocusNode? focus;
  final bool obscureText;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;

  const MyCustonText({
    super.key,
    required this.controller,
    required this.label,
    required this.inputType,
    this.maxLength = 0,
    this.perfixIcon,
    this.focus,
    this.submit,
    this.onTapOutside,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<MyCustonText> createState() => _MyCustonTextState();
}

class _MyCustonTextState extends State<MyCustonText> {
  bool secret = false;

  @override
  void initState() {
    secret = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onTapOutside: widget.onTapOutside,
        onEditingComplete: widget.submit,
        focusNode: widget.focus,
        obscureText: secret,
        validator: widget.validator,
        cursorColor: Theme.of(context).colorScheme.primary,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          prefixIcon: widget.perfixIcon != null
              ? Icon(
                  widget.perfixIcon,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
          suffixIcon: widget.obscureText == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      secret = !secret;
                    });
                  },
                  icon: Icon(
                    !secret ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : null,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          errorStyle: const TextStyle(fontWeight: FontWeight.bold),
          isDense: true,
          label: Text(widget.label),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        controller: widget.controller,
        keyboardType: widget.inputType,
        maxLength: widget.maxLength == 0 ? null : widget.maxLength,
      ),
    );
  }
}
