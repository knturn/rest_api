import 'package:flutter/material.dart';
import 'ricky_morties_view_model.dart';

class RickandMortyView extends RickandMortiesViewModel {
  int length = 1;
  @override
  void initState() {
    fetchAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Json Practise")),
        backgroundColor: Colors.blueAccent,
      ),
      body: (models.info == null) ? progressindicator() : buildlistview(),
      floatingActionButton: buildbutton(),
    );
  }

  Widget progressindicator() =>
      const Center(child: CircularProgressIndicator());

  FloatingActionButton buildbutton() {
    return FloatingActionButton(
        onPressed: (() {
          if (length < 20) {
            length++;
          } else {
            length = 20;
          }

          setState(() {});
        }),
        child: const Icon(Icons.add));
  }

  ListView buildlistview() {
    return ListView.builder(
      itemCount: models.results?[length - 1].id,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          leading: Text(models.results?[index].id.toString() ?? ''),
          trailing: CircleAvatar(
              backgroundImage:
                  NetworkImage(models.results?[index].image.toString() ?? '')),
          title: Text(models.results?[index].name.toString() ?? ''),
          subtitle: Text(models.results![index].gender.toString()),
        ),
      ),
    );
  }
}
