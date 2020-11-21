import 'package:flutter/material.dart';

class RoundedCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onValueChanged;

  const RoundedCheckBox({
    Key key,
    this.onValueChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onValueChanged(!value);
      },
      child: Container(
        width: 26,
        height: 26,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: value
            ? Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
          size: 20,
        )
            : const SizedBox(
          width: 26,
          height: 26,
        ),
      ),
    );
  }
}
