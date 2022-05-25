import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: buildAppbar(),
      body: (models.info == null) ? progressindicator() : buildlistview(),
      floatingActionButton: buildbutton(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Center(child: Text("Json Practise")),
      backgroundColor: Colors.blueAccent,
    );
  }

  Widget progressindicator() =>
      const Center(child: CircularProgressIndicator());

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

  Widget buildbutton() {
    return FloatingActionButton(
        onPressed: (() {
          if (length < 20) {
            length++;
          } else {
            length = 20;
            return _showMyDialog();
          }

          setState(() {});
        }),
        child: const Icon(Icons.add));
  }

  void _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Data is over :("),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("We have got only 20 characters here"),
                Text("If you want to start begining, tap yes!"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('YES!'),
              onPressed: () {
                Navigator.of(context).pop();
                length = 1;
                setState(() {});
              },
            ),
            TextButton(
              child: const Text("No that's enough..."),
              onPressed: () {
                SystemNavigator.pop();
              },
            )
          ],
        );
      },
    );
  }
}
