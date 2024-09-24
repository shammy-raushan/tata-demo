import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final bool isChecked;
  final onChanged;
  const ReadMoreText({super.key, required this.isChecked, this.onChanged});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  final String _fullText =
      'I authorize the Bank and its representatives to Call, SMS or communicate via WhatsApp regarding my application. This is additional information that is revealed when the text is expanded. It provides further details about the application process and terms.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints:
                BoxConstraints(maxHeight: _isExpanded ? double.infinity : 40),
            child: Text(
              _fullText,
              maxLines: _isExpanded ? null : 2,
              overflow:
                  _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                letterSpacing: 0.4,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? ' Read Less' : ' Read More',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
