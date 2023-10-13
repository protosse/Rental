import 'package:flutter/material.dart';
import 'package:reader/src/common/common.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({super.key, required this.text});

  @override
  State<DescriptionTextWidget> createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  bool showMore = false;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    _splitText();
  }

  _splitText() {
    showMore = widget.text.length > 300;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: showMore
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flag ? '${widget.text.substring(0, 300)}...' : widget.text,
                  style: TextStyle(
                      fontSize: 16,
                      color: context.theme.textTheme.bodySmall?.color),
                ),
                GestureDetector(
                  child: Text(
                    flag ? 'show more' : 'show less',
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                )
              ],
            )
          : Text(
              widget.text,
              style: TextStyle(
                  fontSize: 16,
                  color: context.theme.textTheme.bodySmall?.color),
            ),
    );
  }
}
