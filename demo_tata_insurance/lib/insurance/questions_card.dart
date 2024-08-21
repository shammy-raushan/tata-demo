import 'package:flutter/material.dart';

class QuestionsCard extends StatefulWidget {
  final Map<String, dynamic> data;

  const QuestionsCard({super.key, required this.data});

  @override
  _QuestionsCardState createState() => _QuestionsCardState();
}

class _QuestionsCardState extends State<QuestionsCard> {
  String _selectedOption = 'No';

  void _handlePress(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularCard(imageUrl: ''),
            Text(widget.data['ques'],
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(widget.data['ans'], style: TextStyle(fontSize: 14)),
            SizedBox(height: 16.0),
            Row(
              children: [
                CustomTextButton(
                  option: 'Yes',
                  selectedOption: _selectedOption,
                  onPressed: () => _handlePress('Yes'),
                  text: 'Yes',
                ),
                SizedBox(width: 12.0),
                CustomTextButton(
                  option: 'No',
                  selectedOption: _selectedOption,
                  onPressed: () => _handlePress('No'),
                  text: 'No',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircularCard extends StatelessWidget {
  final String imageUrl;

  const CircularCard({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white, // Background color
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color and opacity
            spreadRadius: 2.0, // Spread radius of the shadow
            blurRadius: 8.0, // Blur radius of the shadow
          ),
        ],
        image: imageUrl.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl.isNotEmpty
          ? null
          : Center(
              child: Icon(
                Icons.heat_pump_rounded,
                size: 32.0, // Adjust icon size as needed
                color: Colors.blue.shade900, // Icon color
              ),
            ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String option;
  final String selectedOption;
  final VoidCallback onPressed;
  final String text;

  CustomTextButton({
    required this.option,
    required this.selectedOption,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
              option == selectedOption ? Color(0xFF51971D) : Colors.white,
          foregroundColor:
              option == selectedOption ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
            side: BorderSide(color: Colors.grey, width: 1.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
