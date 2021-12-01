import 'dart:math';
import 'dart:ui';
import 'package:efficacy_user/pages/sign_up.dart';
import 'package:flutter/material.dart';
// import 'package:efficacy_user/themes/efficacy_usercolor.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
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
        children: [
          //  First part gradient background
          buildBackground(),
          //  Part 2
          buildBobbleWeight(context),
          //    Part III Gaussian
          buildBlurWeight(),

          Center(
            child: GlassmorphicContainer(
              width: 350,
              height: 400,
              borderRadius: 20,
              blur: 0,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.1),
                  const Color(0xFFFFFFFF).withOpacity(0.05),
                ],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFbde6ed).withOpacity(0.5),
                  const Color((0xFFbde6ed)).withOpacity(0.5),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      image: DecorationImage(
                        image: AssetImage('assets/efficacy_logo.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const SignInButton(),
                ],
              ),
            ),
          )
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

  buildTopText() {
    return Positioned(
      left: MediaQuery.of(context).size.width / 2,
      top: 30,
      child: Container(
        height: 150,
        width: 150,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(200)),
          image: DecorationImage(
            image: AssetImage('assets/efficacy_logo.jpg'),
            fit: BoxFit.cover,
          ),
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

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 312,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff4783C7)),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: const [
              CustomBoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 1.5,
                  blurStyle: BlurStyle.outer)
            ]),
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/google_logo.png'),
                width: 33,
                height: 33,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Continue with Google',
                  style: TextStyle(
                      color: Color(0xff1976D2),
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBoxShadow extends BoxShadow {
  final BlurStyle blurStyle;

  const CustomBoxShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    this.blurStyle = BlurStyle.normal,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) result.maskFilter = null;
      return true;
    }());
    return result;
  }
}
