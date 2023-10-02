import 'package:flutter/material.dart';
import 'package:kuis_prak_pam/login_page.dart';
import 'package:kuis_prak_pam/penyakit.dart';
import 'package:kuis_prak_pam/profil.dart';

class page1 extends StatelessWidget {
  const page1({super.key});

  void logout(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(25),
              crossAxisCount: 3,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, //buat next ke halaman sleanjutnya
                          MaterialPageRoute(builder: (context) {
                        return profil();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.person,
                            size: 70,
                            color: Colors.blueAccent,
                          ),
                          Text("Profile", style: TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, //buat next ke halaman sleanjutnya
                          MaterialPageRoute(builder: (context) {
                            return penyakit();
                          }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.sick,
                            size: 70,
                            color: Colors.blueGrey,
                          ),
                          Text("Jenis Penyakit",
                              style: TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      logout(context);
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.logout,
                            size: 70,
                            color: Colors.green,
                          ),
                          Text("Keluar", style: TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
