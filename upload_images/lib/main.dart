import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Upload MySQL',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  final picker = ImagePicker();
  TextEditingController cTitle = TextEditingController();

  //function getImage via camera
  Future getImageCamera() async {
    //deklarasi variabel imageFile
    final imageFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (imageFile != null) {
        _image = File(imageFile.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  //function getImage Gallery
  Future getImageGallery() async {
    var imageFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (imageFile != null) {
        _image = File(imageFile.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  //function uploadImage
  Future uploadImage() async{
    final uri = Uri.parse("http://192.168.42.115/flutterbackend/upload.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['title'] =  cTitle.text;
    var pic  = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();
    if(response.statusCode == 200){
      print('Upload Berhasil');
    } else{
      print('Upload Gagal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: _image == null
                  ? Text('No Image Selected')
                  : Image.file(_image),
            ),
            TextField(
              controller: cTitle,
              decoration: InputDecoration(
                hintText: 'Judul',
              ),
            ),
            Row(
              children: [
                RaisedButton(
                  child: Icon(Icons.image),
                  onPressed: () {
                    //untuk ambil gambar di gallery
                    getImageGallery();
                  },
                ),
                RaisedButton(
                  child: Icon(Icons.camera_alt),
                  onPressed: () {
                    //untuk ambil gambar via camera
                    getImageCamera();
                  },
                ),
                RaisedButton(
                  child: Text('Upload Now'),
                  onPressed: () {
                    //untuk function uploadnya
                    uploadImage();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
