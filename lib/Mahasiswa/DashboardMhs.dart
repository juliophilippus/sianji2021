import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peterpan_sianji/Konsultasi/AddKonsul.dart';
import 'package:peterpan_sianji/Mahasiswa/LihatDsn.dart';
import 'package:peterpan_sianji/main.dart';

class DashboardMhs extends StatefulWidget {  //<~~~
  // DashboardMhs({Key key, this.title}) : super(key: key);  //<~~~~
  //
  // final String title;

  final String nama, email, foto;

  DashboardMhs({this.nama, this.email, this.foto});

  @override
  _DashboardMhsState createState() => _DashboardMhsState();  //<~~~~
}

class _DashboardMhsState extends State<DashboardMhs> {    //<~~


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
              title: Text("Lihat List Dosen"),    //<~~~~
              trailing: Icon(Icons.people_alt),   //<~~~
              subtitle: Text("List Dosen"),  //<~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LihatDsn(title: "LIHAT DOSEN")),  //<~~
                );
              },
            ),
            ListTile(
              title: Text("Pengajuan Jadwal Konsultasi"),   //<~~~
              trailing: Icon(Icons.schedule_outlined),   //<~~
              subtitle: Text("Jadwal Konsultasi"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddKonsul(title: "PENGAJUAN KONSULTASI")),  //<~~
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
                  MaterialPageRoute(builder: (context) => AddKonsul(title: "NOTIFIKASI")),  //<~~
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
            child: Text("MAHASISWA",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          )
      ),
    );
  }
}