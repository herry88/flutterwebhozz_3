import 'package:flutter/material.dart';

class DetailUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/bekasi.jpg',
            ),
            Container(
              margin: EdgeInsets.only(
                top: 16.0,
              ),
              child: new Text(
                'Kota Bekasi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.new_releases_outlined,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'News',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.access_time,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '08.00-18.00',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.help,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'FAQ',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis ornare dolor. Aenean facilisis, velit quis suscipit tristique, ex mauris aliquam metus, id convallis dolor lorem id dui. Aenean arcu turpis, pharetra at turpis quis, imperdiet auctor metus. Vivamus vestibulum aliquet ligula et lobortis. Cras fermentum justo sit amet metus finibus pharetra. Maecenas id augue sed mauris feugiat suscipit eget vitae ligula. Etiam a orci nec tortor consequat malesuada vitae ut sem.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              height: 150.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      4.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      child: Image.network(
                          'https://mmc.tirto.id/image/otf/500x0/2016/07/29/TIRTO-antarafoto-ruang-terbuka-hijau-290716-ipp-4_ratio-16x9.JPG'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      4.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      child: Image.network(
                          'https://mmc.tirto.id/image/otf/500x0/2016/07/29/TIRTO-antarafoto-ruang-terbuka-hijau-290716-ipp-4_ratio-16x9.JPG'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      4.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      child: Image.network(
                          'https://mmc.tirto.id/image/otf/500x0/2016/07/29/TIRTO-antarafoto-ruang-terbuka-hijau-290716-ipp-4_ratio-16x9.JPG'),
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
