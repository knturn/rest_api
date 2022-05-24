import 'package:flutter/material.dart';

import 'package:rest_api/rick_and_morties/model/character_model.dart';

import 'ricky_morties_view_model.dart';

class RickandMortyView extends RickandMortiesViewModel {
  CharacterModel? rickies;
  int length = 0;

  Future loadDatato() async {
    await fetchAllData();
    rickies = models;
    length++;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Json Practise")),
        backgroundColor: Colors.blueAccent,
      ),
      body: (rickies == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: Text(rickies!.results?[index].id.toString() ?? ''),
                  trailing: CircleAvatar(
                      backgroundImage: NetworkImage(
                          rickies!.results?[index].image.toString() ?? '')),
                  title: Text(rickies!.results?[index].name.toString() ?? ''),
                  subtitle: Text(rickies!.results![index].gender.toString()),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() => loadDatato()), child: const Icon(Icons.add)),
    );
  }
}
