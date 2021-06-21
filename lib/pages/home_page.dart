import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




// A function that converts a response body into a List<Photo>.


void main() => runApp(HomePage());

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Home Page - Photos';

  return new Scaffold(
      body: new Center(
        child: MyHomePage(title: appTitle),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final String title;
  BuildContext _ctx;
  MyHomePage({Key key, this.title}) : super(key: key);
  final String personnexttome= "That reminds me about the time when I was ten and our neighbour, her name was Mrs. Mable and she said...";
  @override
  Widget build(BuildContext context) {

    void _second_screen() {
      Navigator.of(context).pushNamed("/second");
    }

    var registerBtn = new RaisedButton(
      padding: const EdgeInsets.all(10.0),
      onPressed: _second_screen,
      child: new Text("Second Screen"),
      color: Colors.green,
    );
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
//        new Text(
//          "App",
//          textScaleFactor: 2.0,
//        ),
//        new Form(
//          key: formKey,
//          child: new Column(
//            children: <Widget>[
//              new Padding(
//                padding: const EdgeInsets.all(20.0),
//                child: new TextFormField(
//                  onSaved: (val) => _email = val,
//                  decoration: new InputDecoration(labelText: "Email"),
//                ),
//              ),
//              new Padding(
//                padding: const EdgeInsets.all(20.0),
//                child: new TextFormField(
//                  onSaved: (val) => _password = val,
//                  decoration: new InputDecoration(labelText: "Password"),
//                ),
//              )
//            ],
//          ),
//        ),


        registerBtn
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: Column(
        children: [

          Row(
            children: [
              Icon(Icons.airline_seat_legroom_reduced),
              Expanded(child: Text(personnexttome)),
              Icon(Icons.airline_seat_legroom_reduced),
//              Container(
//                child:  Text(personnexttome,
//                  style: TextStyle(fontSize: 18),),
//
//              ),
            ],
          ),
          new Container(
            child: new Center(
              child: loginForm,

            ),

          ),

        ],
      ),


    );

  }
}

//class PhotosList extends StatelessWidget {
//  final List<Photo> photos;
//
//  PhotosList({Key key, this.photos}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.builder(
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 2,
//      ),
//      itemCount: photos.length,
//      itemBuilder: (context, index) {
//        return Image.network(photos[index].thumbnailUrl);
//      },
//    );
//  }
//}