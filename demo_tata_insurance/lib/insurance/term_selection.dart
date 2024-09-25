import 'package:demo_tata_insurance/insurance/components/submit_button.dart';
import 'package:demo_tata_insurance/insurance/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart' as intl;
import 'package:demo_tata_insurance/global.dart' as globals;

import '../utils/utils.dart';
import 'components/custom_stepper.dart';

enum ProductType { Gold, Silver, Dimond, Blank }

class TermSelection extends StatefulWidget {
  const TermSelection({super.key});

  @override
  State<TermSelection> createState() => _TermSelectionState();
}

class _TermSelectionState extends State<TermSelection> {
  final myController = TextEditingController();

  int months_option = globals.months_option;

  double rate = 7.20;

  String selectType = globals.interest_type;
  int selectAmount = globals.deposit_amount;
  int finalAmount = globals.maturity_amount;
  double tenure = globals.tenure;
  var formats = intl.NumberFormat.currency(
    locale: 'en_IN',
    decimalDigits: 0, // change it to get decimal places
    // symbol: '₹ ',
    symbol: ' ',
  );
  var formatRupee = intl.NumberFormat.currency(
    locale: 'en_IN',
    decimalDigits: 0, // change it to get decimal places
    symbol: '₹ ',
  );

  static List<Map<String, dynamic>> termAmount = [
    {"label": "10 L", "value": 1000000},
    {"label": "25 L", "value": 2500000},
    {"label": "50 L", "value": 5000000},
    {"label": "1 Cr", "value": 10000000},
  ];

  static List<Map<String, dynamic>> termTenure = [
    {"label": "1 yr", "value": 1},
    {"label": "2 yrs", "value": 2},
    {"label": "3 yrs", "value": 3},
    {"label": "5 yrs", "value": 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/tata-logo.png', width: 100, height: 60),
        automaticallyImplyLeading: false,
        actions: const <Widget>[
          Icon(Icons.pin_drop),
          Text("New Delhi",
              style: TextStyle(fontSize: 16, color: Colors.black)),
          SizedBox(width: 15),
        ],
      ),
      body: Stack(children: <Widget>[
        Positioned.fill(
            child: Opacity(
          opacity: 0.04,
          child: Image.asset('assets/pattern.png', fit: BoxFit.cover),
        )),
        Positioned.fill(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomStepper(currentStep: 1),
                  Image.asset('assets/InsuredCouple.png', fit: BoxFit.cover),
                  PhysicalModel(
                    color: Color.fromARGB(244, 255, 255, 255),
                    elevation: 1,
                    // shadowColor: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        constraints: BoxConstraints(maxWidth: 350),
                        margin: const EdgeInsets.fromLTRB(20, 35, 20, 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _TitleCard(),
                            const SizedBox(height: 46),
                            AmountSlider(
                              onTermAmountSelected: onTermAmountSelected,
                              selectAmount: selectAmount,
                              termAmount: termAmount,
                            ),
                            const SizedBox(height: 40),
                            TenureSlider(
                              onYearSelected: onTermTenureSelected,
                              selectYear: tenure,
                              termYears: termTenure,
                            ),
                            SizedBox(height: 25),
                            (selectAmount == 5000000)
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            color: Color(0xFFFCD062), width: 1),
                                        color: Color(0x4DFCD062),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 9.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star,
                                              size: 14,
                                              color: Color(0xFFFCD062)),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                                '85% in your age group have opted for this cover',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.0,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            const SizedBox(height: 23),
                            GradientButton(
                                text: "Next",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => planspage(),
                                    ),
                                  );
                                }),
                            const SizedBox(height: 29)
                          ],
                        )),
                  ),
                  const SizedBox(height: 29),
                  _unsureWidget(),
                  _videoWidget()
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void onTermAmountSelected(dynamic amount) {
    setState(() {
      selectAmount = amount.toInt();
    });
  }

  void onTermTenureSelected(double amount) {
    setState(() {
      tenure = amount;
    });
  }
}

class _TitleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "How much coverage amount do you need? ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          WidgetSpan(
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Tooltip(
                  message:
                      'The Maximum amount that the policyholder can claim under a health insurance policy in a policy year.',
                  showDuration: Duration(
                      seconds: 2), // How long the tooltip stays visible
                  decoration: BoxDecoration(
                    color: Color(0xFFE7EEFB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  child: Icon(
                    Icons.help_outline,
                    size: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class AmountSlider extends StatelessWidget {
  final selectAmount;
  final Function(dynamic) onTermAmountSelected;
  final List<Map<String, dynamic>> termAmount;
  AmountSlider(
      {super.key,
      required this.selectAmount,
      required this.onTermAmountSelected,
      required this.termAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Select Amount",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                  )),
              Text(
                  'INR ${formatCurrency((selectAmount > 0) ? selectAmount : 1000000)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: Color(0xFFE6E6E9),
            thumbShape: CustomThumbShape(),
            overlayColor: Colors.transparent,
            trackHeight: 8.0,
            overlayShape: SliderComponentShape.noOverlay,
          ),
          child: Slider(
            value: selectAmount.toDouble(),
            min: 50000,
            max: 10000000,
            divisions: (10000000 ~/ 50000) - 1,
            label: selectAmount.round().toString(),
            onChanged: onTermAmountSelected,
            activeColor: Color(0xFF2B62AA),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('INR ${formatCurrency(50000)}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                  )),
              Text('INR ${formatCurrency(10000000)}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 20.0,
          runSpacing: 24.0,
          children: termAmount.asMap().entries.map((entry) {
            var option = entry.value;
            return TermChip(
              option: option,
              isSelected: selectAmount == option['value'],
              onTermAmountSelected: onTermAmountSelected,
              prefix: '₹ ',
            );
          }).toList(),
        ),
      ],
    );
  }
}

class TenureSlider extends StatelessWidget {
  final selectYear;
  final Function(double) onYearSelected;
  final List<Map<String, dynamic>> termYears;
  const TenureSlider(
      {super.key,
      required this.selectYear,
      required this.onYearSelected,
      required this.termYears});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Select tenure",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                  )),
              Text('${selectYear.round()} Year${selectYear > 1 ? 's' : ''}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: Color(0xFFE6E6E9),
            thumbShape: CustomThumbShape(),
            overlayColor: Colors.transparent,
            trackHeight: 8.0,
            overlayShape: SliderComponentShape.noOverlay,
          ),
          child: Slider(
            value: selectYear.toDouble(),
            min: 1,
            max: 7,
            divisions: 6,
            label: selectYear.round().toString(),
            onChanged: onYearSelected,
            activeColor: Color(0xFF2B62AA),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('6 months',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                  )),
              Text('7 Years',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 14.0,
          runSpacing: 24.0,
          children: termYears.asMap().entries.map((entry) {
            var option = entry.value;
            return TermChip(
              option: option,
              isSelected: selectYear == option['value'],
              onTermAmountSelected: (value) => onYearSelected(value.toDouble()),
              prefix: '₹ ',
            );
          }).toList(),
        ),
      ],
    );
  }
}

class TermChip extends StatelessWidget {
  final Map<String, dynamic> option;
  final bool isSelected;
  final Function(int) onTermAmountSelected;
  final String prefix;
  const TermChip(
      {super.key,
      required this.option,
      required this.isSelected,
      required this.onTermAmountSelected,
      this.prefix = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTermAmountSelected(option['value']);
        },
        child: Stack(
          children: [
            isSelected
                ? Positioned(
                    top: 0,
                    right: 5,
                    child: Icon(Icons.star, size: 14, color: Color(0xFFFCD062)),
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: isSelected
                      ? Border.all(color: Color(0xFFFCD062), width: 1)
                      : null,
                  color: isSelected ? Color(0x4DFCD062) : Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${prefix}${option['label']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class CustomThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isDiscrete, bool isEnabled) => Size(30, 30);

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required Size sizeWithOverflow,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double textScaleFactor,
      required double value}) {
    // Create the shadow effect
    final Paint shadowPaint = Paint()
      ..color = Colors.black87
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, 5); // Adjust the blur radius

    // Draw the shadow first
    context.canvas.drawCircle(
        center.translate(0, 5), 10, shadowPaint); // Slightly offset down

    // Draw the thumb
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Color(0xFF2B62AA) // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; // Border width

    final double borderWidth = 1.0; // Border width
    final double radius = 12.0; // Radius of the outer circle

    // Draw the border circle
    context.canvas.drawCircle(center, radius, borderPaint);

    // Draw the inner circle (thumb) with radius adjusted to avoid spacing
    context.canvas.drawCircle(center, radius - borderWidth, paint);
  }
}

class _videoWidget extends StatelessWidget {
  const _videoWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      constraints: BoxConstraints(maxWidth: 380),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFE7EEFB),
        border: Border.all(
          color: Color(0xFF254A9E), // Border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/Mask-group.png',
            height: 63,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              "The right cover amount for you!",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF787878),
              ),
            ),
          ),
          Icon(
            Icons.play_circle,
            color: Color(0xFF5F6368),
            size: 14,
          )
        ],
      ),
    );
  }
}

class _unsureWidget extends StatelessWidget {
  const _unsureWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          constraints: BoxConstraints(maxWidth: 350),
          margin: const EdgeInsets.fromLTRB(20, 35, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Unsure of the right coverage amount?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: const Text(
                      "Complete this short questionnaire to find the ideal coverage for you.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0B2110)),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: SvgPicture.asset(
                        'assets/KycForm.svg',
                        width: 60,
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Divider(),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => planspage(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Start Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
