import 'package:flutter/material.dart';
import 'package:fresh_flash/controller/provider/electronics_provider.dart';
import 'package:provider/provider.dart';

class Electronics extends StatefulWidget {
  const Electronics({Key? key}) : super(key: key);

  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  @override
  void initState() {
    super.initState();
    final electro = Provider.of<ElectronicsProvider>(context, listen: false);
    electro.electronics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronics'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Consumer<ElectronicsProvider>(
        builder: (context, electronics, _) {
          final electronic = electronics.newsApiResModel;
          if (electronics.isloading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (electronics.error.isNotEmpty) {
            return Text('Error: ${electronics.error}');
          } else {
            return ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * .55,
                        width: MediaQuery.of(context).size.width,
                        child: electronic!.articles![index].urlToImage != null
                            ? Image.network(
                                electronic.articles![index].urlToImage!,
                                fit: BoxFit.contain,
                                scale: 0.5,
                              )
                            : Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeQhQTtgB7bEsFlH6rxb5zPsOgOa5yxnCVQ&usqp=CAU',
                                fit: BoxFit.contain,
                                scale: 0.5,
                              )),
                    ExpansionTile(
                      title: Text(electronic!.articles?[index].title ?? ''),
                      subtitle: Text(
                          'Authur :${electronic!.articles?[index].author}'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              electronic!.articles?[index].description ?? ''),
                        )
                      ],
                    ),
                  ],
                ),
              );
            });
          }
        },
      ),
    );
  }
}
