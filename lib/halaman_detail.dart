import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pokemon_data.dart';

class HalamanDetail extends StatelessWidget {
  final PokemonData data; 
  const HalamanDetail({ super.key, required this.data});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pokemon Detail'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.network(data.image),
          ),
          SizedBox(height: 16,),
          Text(data.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16,),
          Text('Type',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("${data.type}"),
          SizedBox(height: 16,),
          Text('Weakness',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("${data.weakness}"),
          SizedBox(height: 16,),
          Text('Previous Evolution',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("${data.prevEvolution}"),
          SizedBox(height: 16,),
          Text('Next Evolution',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("${data.nextEvolution}"),
          SizedBox(height: 16,),
          IconButton(
            onPressed: (){
              launchURL(data.wikiUrl);
            }, 
            icon: Icon(Icons.travel_explore),
            color: Colors.red,
          )
        ],
      )
    );
  }
}

Future <void> launchURL(String url) async{
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
}