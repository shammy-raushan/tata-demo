import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final ValueChanged<bool?>? onChanged;
  final bool isChecked;
  final String fullText;

  ExpandableText(
      {required this.fullText,
      required this.onChanged,
      this.isChecked = false});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(value: widget.isChecked, onChanged: widget.onChanged),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    final textPainter = TextPainter(
                      text: TextSpan(
                        text: widget.fullText,
                        style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 0.4,
                            color: Colors.black),
                      ),
                      maxLines: _isExpanded ? null : 2,
                      textDirection: TextDirection.ltr,
                    );

                    textPainter.layout(maxWidth: constraints.maxWidth);

                    final isOverflowing = textPainter.didExceedMaxLines;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxHeight: _isExpanded ? double.infinity : 40),
                          child: Text(
                            widget.fullText,
                            maxLines: _isExpanded ? null : 2,
                            overflow: _isExpanded
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 11, letterSpacing: 0.4),
                          ),
                        ),
                        if (isOverflowing && !_isExpanded)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = true;
                              });
                            },
                            child: Text(
                              ' Read More',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 11),
                            ),
                          ),
                        if (_isExpanded)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = false;
                              });
                            },
                            child: Text(
                              ' Read Less',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 11),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
