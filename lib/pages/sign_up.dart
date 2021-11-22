import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  final List<BobbleBean> _list = [];
  final Random _random = Random(DateTime.now().microsecondsSinceEpoch);
  //  Motion speed control
  final double _maxSpeed = 1.3;
  //  Set the maximum radius
  final double _maxRadius = 80;

  //  Set the maximum angle
  final double _maxTheta = 2 * pi;
  late AnimationController _animationController;
  late AnimationController _fadeAnimationController;
  String initialcountry = 'IN';

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 15; i++) {
      BobbleBean bean = BobbleBean();

      bean.color = const Color.fromRGBO(129, 220, 237, 1);
      bean.position = const Offset(-1, -1);

      bean.speed = _random.nextDouble() * _maxSpeed;

      bean.radius = _random.nextDouble() * _maxRadius;
      bean.theta = _random.nextDouble() * _maxTheta;

      _list.add(bean);
    }
    //Create an animation controller for 2 second
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    //  Perform refresh monitor
    _animationController.addListener(() {
      setState(() {});
    });
    //  Repeated execution
    // _animationController.repeat();

    _fadeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));
    _fadeAnimationController.forward();
    _fadeAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          //  First part gradient background
          buildBackground(),
          //  Part 2
          buildBobbleWeight(context),
          //    Part III Gaussian
          // buildBlurWeight(),
          GlassmorphicContainer(
            width: MediaQuery.of(context).size.width - 60,
            height: MediaQuery.of(context).size.height * 0.8,
            borderRadius: 20,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.1),
                const Color(0xFFFFFFFF).withOpacity(0.05),
              ],
            ),
            border: 1,
            blur: 5,
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.5),
                const Color((0xFFFFFFFF)).withOpacity(0.5),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  //    Steady on the top of the top
                  buildTopText(),
                  //    Part 5 Input Area
                  buildBottomColumn()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  First part gradient background
  buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightBlueAccent.withOpacity(0.3),
            Colors.lightBlue.withOpacity(0.3),
            Colors.blue.withOpacity(0.3),
          ],
        ),
      ),
    );
  }

  buildBobbleWeight(BuildContext context) {
    //Drawboard
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: CustomMyPainter(list: _list, random: _random),
    );
  }

  buildBlurWeight() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
      child: Container(
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }

  buildTopText() {
    return Container(
      height: 120,
      width: 120,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(200)),
        image: DecorationImage(
          image: AssetImage('assets/efficacy_logo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  buildBottomColumn() {
    return FadeTransition(
      opacity: _fadeAnimationController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Custom text input box
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            child: TextFieldWidget(
              obscureText: false,
              labelText: "Email",
              prefixIconData: Icons.email_outlined,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            child: TextFieldWidget(
              obscureText: false,
              labelText: "Name",
              prefixIconData: Icons.person,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            child: IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                enabledBorder: InputBorder.none,
              ),
              onChanged: (phone) {},
              initialCountryCode: 'IN',
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 42,
            width: 130,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('FINISH'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  Function(String value)? onChanged;
  bool obscureText;
  String? labelText;
  IconData? prefixIconData;
  IconData? suffixIconData;

  TextFieldWidget(
      {Key? key,
      this.onChanged,
      required this.obscureText,
      this.labelText,
      this.prefixIconData,
      this.suffixIconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.blue, fontSize: 14.0),
      //    When the input box is available while the border configuration is
      decoration: InputDecoration(
        filled: true,
        labelText: labelText,
        //  Remove the default underscore
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        //  Get the border style when entering the focus
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blue)),
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Colors.blue,
        ),
        suffixIcon: Icon(
          suffixIconData,
          size: 18,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class CustomMyPainter extends CustomPainter {
  List<BobbleBean> list;
  Random random;
  final Paint _paint = Paint()..isAntiAlias = true;
  CustomMyPainter({required this.list, required this.random});

  @override
  void paint(Canvas canvas, Size size) {
    for (var element in list) {
      Offset newCenterOffset = calculateXY(element.speed, element.theta);
      double dx = newCenterOffset.dx + element.position.dx;
      double dy = newCenterOffset.dx + element.position.dy;
      if (dx < 0 || dx > size.width) {
        dx = random.nextDouble() * size.width;
      }
      if (dy < 0 || dy > size.height) {
        dy = random.nextDouble() * size.height;
      }
      element.position = Offset(dx, dy);
    }

    for (var element in list) {
      _paint.color = element.color;

      canvas.drawCircle(element.position, element.radius, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Offset calculateXY(double speed, double theta) {
    return Offset(speed * cos(theta), speed * sin(theta));
  }
}

///  Define bubble
class BobbleBean {
  //Location
  late Offset position;

  //colour
  late Color color;

  //speed
  late double speed;

  //  angle
  late double theta;

  //  radius
  late double radius;
}
