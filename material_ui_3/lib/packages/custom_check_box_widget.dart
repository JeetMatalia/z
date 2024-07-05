import 'package:flutter/material.dart';

class CustomCheckboxListTile extends StatelessWidget {
  final Widget title;
  final bool? value;
  final bool tristate;
  final ValueChanged<bool?>? onChanged;
  final bool isError;
  final ListTileControlAffinity controlAffinity;

  const CustomCheckboxListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.tristate,
    required this.onChanged,
    this.isError = false,
    this.controlAffinity = ListTileControlAffinity.platform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: title,
      controlAffinity: controlAffinity,
      tristate: tristate,
      value: value,
      onChanged: isError ? null : onChanged,
      secondary: isError
          ? Icon(
        Icons.error_outline,
        color: Theme.of(context).colorScheme.error,
      )
          : null,
    );
  }
}
