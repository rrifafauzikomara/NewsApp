import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info/package_info.dart';
import 'package:shared/common/common.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<String> _getVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    return info.version;
  }

  _startSplashScreen() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, _navigationPage);
  }

  void _navigationPage() {
    Modular.to.pushReplacementNamed(Modular.get<NamedRoutes>().listArticlePage);
  }

  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: SvgPicture.asset(
                  ImageAssets.logo,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FutureBuilder<String>(
                future: _getVersion(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  var verInfo = "";
                  if (snapshot.hasData) {
                    verInfo = "v ${snapshot.data}";
                  }
                  return Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text(
                      verInfo,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
