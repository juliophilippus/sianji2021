import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peterpan_sianji/Dosen/DashboardDsn.dart';
import 'package:peterpan_sianji/Mahasiswa/DashboardMhs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _isLoggedIn = false;


  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    final googleUser = await GoogleSignIn().signIn();
    if(googleUser != null && googleUser.email.contains("si.ukdw.ac.id")){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DashboardDsn(nama: googleUser.displayName, email: googleUser.email, foto: googleUser.photoUrl,)));
    } else if(googleUser != null && googleUser.email.contains("gmail.com")){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DashboardMhs(nama: googleUser.displayName, email: googleUser.email, foto: googleUser.photoUrl,)));
    }
  }

  _logout() async{
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {return Scaffold(
      body: Center(
        child: OutlineButton.icon(
          label: Text(
            'Sign In With Google',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          highlightedBorderColor: Colors.black,
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
          onPressed: () {
            _login();
          },
        ),
      ),
    );
  }
}
