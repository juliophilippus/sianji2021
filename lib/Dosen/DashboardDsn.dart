import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peterpan_sianji/Dosen/DaftarKonsul.dart';
import 'package:peterpan_sianji/Dosen/LihatGrafik.dart';
import 'package:peterpan_sianji/Dosen/VerifKonsul.dart';

import '../main.dart';

class DashboardDsn extends StatefulWidget {  //<~~~
  // DashboardDsn({Key key, this.title}) : super(key: key);  //<~~~~
  //
  // final String title;

  final String nama, email, foto;

  DashboardDsn({this.nama, this.email, this.foto});

  @override
  _DashboardDsnState createState() => _DashboardDsnState();  //<~~~~
}

class _DashboardDsnState extends State<DashboardDsn> {    //<~~


  @override
  void initState() {
    super.initState();
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool _isLoggedIn = false;

  _logout() async{
    await _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
    Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context) => LoginPage()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("${widget.nama}"),
                accountEmail: Text("${widget.email}"),
                currentAccountPicture:CircleAvatar(
                  backgroundImage: NetworkImage(widget.foto),
                )
            ),
            ListTile(
              title: Text("Lihat Daftar Konsultasi"),    //<~~~~
              trailing: Icon(Icons.list_alt),   //<~~~
              subtitle: Text("Daftar Konsultasi"),  //<~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DaftarKonsul(title: "DAFTAR KONSULTASI")),  //<~~
                );

              },
            ),
            ListTile(
              title: Text("Lihat Grafik Pertemuan"),   //<~~~
              trailing: Icon(Icons.graphic_eq_outlined),   //<~~
              subtitle: Text("Grafik Pertemuan"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LihatGrafik(title: "GRAFIK PERTEMUAN")),  //<~~
                );

              },//<~~~
            ),
            ListTile(
              title: Text("Verifikasi Konsultasi"),   //<~~~
              trailing: Icon(Icons.verified),   //<~~
              subtitle: Text("Verifikasi"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerifKonsul(title: "VERIFIKASI KONSULTASI")),  //<~~
                );

              },//<~~~
            ),
            ListTile(
              title: Text("Notifikasi"),   //<~~~
              trailing: Icon(Icons.notifications),   //<~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerifKonsul(title: "NOTIFIKASI")),  //<~~
                );
              },//<~~~
            ),
            Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text("LOGOUT"),   //<~~~
              trailing: Icon(Icons.logout),   //<~~
              onTap: () {
                _logout();
              },
            ),
          ],
        ),
      ),
      body: Container(
          child: Center(
            child: Text("DOSEN",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          )
      ),
    );
  }
}