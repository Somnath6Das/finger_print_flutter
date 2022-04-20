import 'package:finger_print/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthPath extends StatefulWidget {
  AuthPath({Key? key}) : super(key: key);

  @override
  State<AuthPath> createState() => _AuthPathState();
}

class _AuthPathState extends State<AuthPath> {
  bool? _hasBioSensor;
  LocalAuthentication authentication = LocalAuthentication();
  Future<void> _chequeBio() async {
    try {
      _hasBioSensor = await authentication.canCheckBiometrics;
      print(_hasBioSensor);
      if (_hasBioSensor!) {
        _getAuth();
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getAuth() async {
    bool isAuth = false;
    try {
      isAuth = await authentication.authenticate(
          localizedReason: "Scan your finger print to enter the app",
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true);

      if (isAuth) {
        //Navigate to home page
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      print(isAuth);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _chequeBio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [SizedBox(height: 300,),
          Text(
            "       Hello Supriyo,\n Touch Your Finger here!",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 30),
          
        ],
      ),
    floatingActionButton: FloatingActionButton(  onPressed: () {
                _chequeBio();
              },
              child: Icon(Icons.fingerprint),),);
  }
}
