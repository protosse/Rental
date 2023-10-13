import 'package:flutter/material.dart';
import 'package:reader/src/common/common.dart';

class LabelChips extends StatelessWidget {
  final List<String> labels;
  const LabelChips({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...labels.map((label) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: context.theme.colorScheme.secondary,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7.0,
                  vertical: 5,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: context.theme.colorScheme.secondary,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
