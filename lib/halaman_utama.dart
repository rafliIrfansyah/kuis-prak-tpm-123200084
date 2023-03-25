import 'package:flutter/material.dart';
import 'package:kuis_prak_mobile/halaman_detail.dart';
import 'pokemon_data.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pokedex'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height) * 1.5,
        ),
        itemCount: listPokemon.length,
        itemBuilder: (context, index){
          final PokemonData data = listPokemon[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => HalamanDetail(data: data),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Image.network(data.image),
                  ),
                  Text(data.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}