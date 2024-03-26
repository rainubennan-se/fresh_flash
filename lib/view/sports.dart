import 'package:flutter/material.dart';
import 'package:fresh_flash/controller/provider/electronics_provider.dart';
import 'package:fresh_flash/controller/provider/sports_provider.dart';
import 'package:provider/provider.dart';

class Sports extends StatefulWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  _SportsState createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  @override
  void initState() {
    super.initState();
    final sports = Provider.of<SportsProvider>(context, listen: false);
    sports.sport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Consumer<SportsProvider>(
        builder: (context, sport, _) {
          final sports = sport.newsApiResModel;
          if (sport.isloading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (sport.error.isNotEmpty) {
            return Text('Error: ${sport.error}');
          } else {
            return ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * .55,
                        width: MediaQuery.of(context).size.width,
                        child: sports!.articles![index].urlToImage != null
                            ? Image.network(
                                sports.articles![index].urlToImage!,
                                fit: BoxFit.contain,
                                scale: 0.5,
                              )
                            : Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeQhQTtgB7bEsFlH6rxb5zPsOgOa5yxnCVQ&usqp=CAU',
                                fit: BoxFit.contain,
                                scale: 0.5,
                              )),
                    ExpansionTile(
                      title: Text(sports!.articles?[index].title ?? ''),
                      subtitle:
                          Text('Authur :${sports!.articles?[index].author}'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text(sports!.articles?[index].description ?? ''),
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
