import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
  await client.get('https://picsum.photos/v2/list');

  // Use the compute function to run parsePhotos in a separate isolate.
  if(response.statusCode==200){
    print("success");
  }
  else
    {
      print("false");
    }
  return compute(parsePhotos, response.body);
}


Future <List<Photo>>fetchPhotos1()async
{
  try{
    var url = "https://picsum.photos/v2/list";
//    var url= "http://192.168.42.151/android_register_login/register_account.php";

    http.Response res = await http.get(Uri.encodeFull(url));

//    var userdata = jsonDecode(res.body) as List;

    if(res.statusCode==200)
    {
      print("true");
    }
    else
      {
        print("falseefmd");
      }
    return compute(parsePhotos, res.body);
  }
  catch(e)
  {}
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String download_url;

  Photo({this.id, this.author, this.width, this.height, this.url, this.download_url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as String,
      author: json['author'] as String,
//      width: int.parse(json['width']),
      width: json['width'] as int,
//      width: json['width'] as String,
//      height: int.parse(json['height']),
      height: json['height'] as int,
//      height: json['height'] as String,
      url: json['url'] as String,
      download_url: json['download_url'] as String,
    );
  }
}

void main() => runApp(Second_Screen());


class Second_Screen extends StatefulWidget {
  @override
  _Second_ScreenState createState() => _Second_ScreenState();


}

class _Second_ScreenState extends State<Second_Screen> {

  @override
  void initState()
  {
    super.initState();
    fetchPhotos(http.Client());
//    getjsondata_status();

  }
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Second Page - Photos';

    return new Scaffold(
      body: new Center(
        child: MyHomePage(title: appTitle),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final String title;


  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.network(photos[index].download_url,fit: BoxFit.fill,height: 150,filterQuality: FilterQuality.low,),
            Text(photos[index].author),
          ],
        );
      },
    );
  }
}