import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final ValueChanged<bool>? onChanged; // callback لما تتغير الحالة
  final bool initialValue; // القيمة الابتدائية

  const CustomSwitch({
    super.key,
    this.onChanged,
    this.initialValue = false, // الافتراضي false
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.initialValue; // يبدأ بالقيمة اللي جاية من بره
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isActive,
      onChanged: (value) {
        setState(() {
          isActive = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value); // استدعاء الأكشن اللي جاي من بره
        }
      },
      activeColor: Colors.white,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.grey,
    );
  }
}
