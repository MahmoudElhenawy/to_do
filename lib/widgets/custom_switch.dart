import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final bool value;

  const CustomSwitch({super.key, this.onChanged, this.value = false});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isActive,
      onChanged: (value) {
        setState(() {
          isActive = value;
        });
        widget.onChanged?.call(value);
      },
      activeColor: Colors.white,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.grey,
    );
  }
}
