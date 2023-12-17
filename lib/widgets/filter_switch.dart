import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilterSwitch extends StatefulWidget {
  FilterSwitch({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  bool isSwitchSelected = false;

  @override
  State<FilterSwitch> createState() => _FilterSwitchState();
}

class _FilterSwitchState extends State<FilterSwitch> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SwitchListTile(
      value: widget.isSwitchSelected,
      onChanged: (newValue) {
        setState(() {
          widget.isSwitchSelected = newValue;
        });
      },
      title: Text(
        widget.title,
        style: theme.textTheme.titleLarge!.copyWith(
          color: theme.colorScheme.onBackground,
        ),
      ),
      subtitle: Text(
        widget.subtitle,
        style: theme.textTheme.labelMedium!.copyWith(
          color: theme.colorScheme.onBackground,
        ),
      ),
      activeColor: theme.colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
