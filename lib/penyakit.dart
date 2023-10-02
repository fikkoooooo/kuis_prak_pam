import 'package:flutter/material.dart';
import 'package:kuis_prak_pam/disease_data.dart';
import 'package:kuis_prak_pam/detail_page.dart';

class penyakit extends StatelessWidget {
  const penyakit({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Diseases"),
        backgroundColor: Colors.blue, // Warna latar belakang AppBar
        actions: [
          // Tombol untuk membuka Page 1

          // Tombol untuk membuka Page
        ],
      ),
      body: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),

        itemBuilder: (context, index) {
          final Diseases place = listDisease[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return detail(place: place);
              }));
            },
            child: Card(
              elevation: 4, // Efek bayangan pada Card
              margin: EdgeInsets.all(10), // Jarak antara Card
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.height / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        place.imgUrls,
                        fit: BoxFit.cover, // Menyesuaikan gambar ke dalam wadah
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      place.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}