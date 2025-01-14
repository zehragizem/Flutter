import 'package:flutter/material.dart';
import 'package:flutter_project/Gossip/gossip.dart';

class animasyon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animationController.forward(); 

    Future.delayed(Duration(seconds: 2), () {
      _animationController.reset(); 
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Gossip()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 144, 223),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                (_animationController.value * MediaQuery.of(context).size.width) - MediaQuery.of(context).size.width / 2,
                0.0,
              ),
              child: child,
            );
          },
          child: Image.asset(
            'images/witch_image.png',
            width: 150.0,
            height: 150.0,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
