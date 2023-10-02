import 'package:flutter/material.dart';
import 'package:kuis_prak_pam/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class detail extends StatelessWidget {
  final Diseases place;
  const detail({Key? key, required this.place}) : super(key: key);

  void _openMapLink(String imgUrls) async {
    if (await canLaunch(imgUrls)) {
      await launch(imgUrls);
    } else {
      throw 'Tidak dapat membuka: $imgUrls';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Detail"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(place.imgUrls, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  SizedBox(height: 8),
                  Text(
                    place.plantName,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        "",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "${place.symptom}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        place.nutshell[0],
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        place.nutshell[1],
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        place.nutshell[2],
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        place.nutshell[3],
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _openMapLink(place.imgUrls);
                    },
                    child: Text("Lihat Gambar"),
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