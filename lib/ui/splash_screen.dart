import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nursik/constants/app_assets.dart';
import 'package:nursik/generated/l10n.dart';
import 'package:nursik/service/repo_settings.dart';
import 'package:nursik/ui/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void timeout() {
    const duration = Duration(seconds: 2);

    Future.delayed(
      duration,
    ).whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    final repoSettings = Provider.of<RepoSettings>(
      context,
      listen: false,
    );
    repoSettings.init().whenComplete(() async {
      var defaultLocale = const Locale('ru', 'RU');
      final locale = await repoSettings.readLocale();
      if (locale == 'en') {
        defaultLocale = const Locale('en');
      }
      S.load(defaultLocale).whenComplete(() {
        timeout();
      });
    });
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
