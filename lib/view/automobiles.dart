import 'package:flutter/material.dart';
import 'package:fresh_flash/controller/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final news = Provider.of<HomeProvider>(context, listen: false);
    news.everyNews();
    print('Inside initstate');
  }

  @override
  Widget build(BuildContext context) {
    // final newsdata = Provider.of<HomeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Automobile'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Consumer<HomeProvider>(
          builder: (context, newsdata, _) {
            final newsData = newsdata.newsApiResModel;
            if (newsdata.isloading == true) {
              return const Center(child: CircularProgressIndicator());
            } else if (newsdata.error.isNotEmpty) {
              return Text('Error: ${newsdata.error}');
            } else {
              return ListView.builder(
                itemCount: newsData?.articles?.length ?? 0,
                itemBuilder: (context, index) {
                  // final article = news!.articles[index];
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(
                                      newsData!.articles![index].urlToImage ??
                                          ''))),
                        ),
                        ExpansionTile(
                          title: Text(newsData!.articles?[index].title ?? ''),
                          subtitle: Text(
                              'Authur :${newsData!.articles?[index].author}'),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  newsData!.articles?[index].description ?? ''),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
