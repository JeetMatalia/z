import 'package:flutter/material.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  final Widget title;
  final T value; //T is a placeholder type used in generics
  final T? groupValue;  //T is a placeholder type used in generics
  final ValueChanged<T?>? onChanged;
  final ListTileControlAffinity controlAffinity;

  const CustomRadioListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.controlAffinity = ListTileControlAffinity.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      title: title,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      controlAffinity: controlAffinity,
    );
  }
}
