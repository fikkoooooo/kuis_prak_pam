import 'package:flutter/material.dart';
import 'package:kuis_prak_pam/login_page.dart';
import 'package:kuis_prak_pam/page1.dart';

class profil extends StatelessWidget {
  final List<Map<String, String>> profiles = [
    {
      'name': 'Fikko Rafirs Yanuar',
      'nim': '124210040',
      'image': 'assets/fik.jpg',
      'description':
      'Saya sedang mengerjakan Kuis Praktikum Pemrograman Aplikasi Mobile. Aslab dari mata kuliah praktiku ini yaitu Mas Mario dan Mas Farrel. Semoga dengan apa yang saya kerjakan bisa mendapatkan nilai A ya mas. Mohon banget loh dapetin nilai A ',},
  ];
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
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          
          IconButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page1(),
              ),
            );
          }, icon: Icon(Icons.account_balance)),
          IconButton(
            onPressed: () {
              logout(context); // Panggil metode logout saat tombol logout ditekan
            },
            icon: Icon(Icons.logout),
          ),


        ],
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return ProfileCard(profile: profiles[index]);
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Map<String, String> profile;

  ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 5,
      child: Column(
        children: <Widget>[
          Image.asset(
            profile['image']!,
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  profile['name']!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  profile['nim']!,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  profile['description']!,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
