import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/ui/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void timeout() {
    const duration = Duration(seconds: 2);
    Future.delayed(duration, () {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      });
    });
  }

  @override
  void initState() {
    timeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppAssets.images.splashBackground,
              ),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.images.logo,
                  ),
                  Expanded(
                    child: Image.asset(
                      AppAssets.images.splashMorty,
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      AppAssets.images.splashRick,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
