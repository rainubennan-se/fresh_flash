import 'package:flutter/material.dart';
import 'package:fresh_flash/controller/provider/headlines_provider.dart';
import 'package:provider/provider.dart';

class Headlines extends StatefulWidget {
  const Headlines({Key? key}) : super(key: key);

  @override
  _HeadlinesState createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> {
  @override
  void initState() {
    super.initState();
    final head = Provider.of<HeadlinesProvider>(context, listen: false);
    head.headlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Headlines'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Consumer<HeadlinesProvider>(
        builder: (context, headlines, _) {
          final headlineNews = headlines.topHeadlinesResModel;
          if (headlines.isloading == true) {
            return const Center(child: CircularProgressIndicator());
          } else if (headlines.error.isNotEmpty) {
            return Center(
              child: Text('Error: ${headlines.error}'),
            );
          } else {
            return ListView.builder(
                itemCount: headlineNews?.sources?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            headlineNews?.sources![index].name ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              headlineNews?.sources![index].description ?? ''),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('  ${headlineNews?.sources![index].url}'),
                        )
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
