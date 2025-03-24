import 'package:flutter/material.dart';

class CustomSwitchTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final Function(bool) onChanged;

  CustomSwitchTile({
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomSwitchTile> createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Colors.blue,
      activeTrackColor: Colors.lightBlue.shade50,
      inactiveTrackColor: Colors.grey.shade200,
      inactiveThumbColor: Colors.grey,
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: widget.subtitle != null
          ? Text(
        widget.subtitle!,
        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
      )
          : null,
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}
