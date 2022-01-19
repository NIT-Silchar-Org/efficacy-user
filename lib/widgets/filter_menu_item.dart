import 'package:flutter/material.dart';

class FilterMenuItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  const FilterMenuItem({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColorLight,
        ),
        color: isSelected
            ? Theme.of(context).primaryColorLight
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: Theme.of(context).primaryColorDark,
            ),
      ),
    );
  }
}
