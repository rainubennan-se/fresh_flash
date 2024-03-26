import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fresh_flash/controller/provider/electronics_provider.dart';
import 'package:fresh_flash/controller/provider/headlines_provider.dart';
import 'package:fresh_flash/controller/provider/home_provider.dart';
import 'package:fresh_flash/controller/provider/sports_provider.dart';
import 'package:fresh_flash/view/bottom.dart';
import 'package:fresh_flash/view/automobiles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => HeadlinesProvider()),
        ChangeNotifierProvider(create: (_) => ElectronicsProvider()),
        ChangeNotifierProvider(create: (_) => SportsProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BottomNav(),
      ),
    );
  }
}

class NewsSplash extends StatefulWidget {
  const NewsSplash({
    super.key,
  });

  @override
  State<NewsSplash> createState() => _NewsSplashState();
}

class _NewsSplashState extends State<NewsSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Animate(
              effects: [FadeEffect(), ScaleEffect()],
              child: Text("Hello World!"),
            ),
            Text("Hello")
                .animate()
                .fade(duration: 500.ms)
                .scale(delay: 500.ms), // runs after fade.
            Text("Hello World!")
                .animate()
                .fadeIn() // uses `Animate.defaultDuration`
                .scale() // inherits duration from fadeIn
                .move(
                    delay: 300.ms,
                    duration: 600.ms) // runs after the above w/new duration
                .blurXY(), // inherits the delay & duration from move
            Text("Hello")
                .animate(
                  delay:
                      1000.ms, // this delay only happens once at the very start
                  onPlay: (controller) => controller.repeat(), // loop
                )
                .fadeIn(
                    delay:
                        500.ms), // this delay happens at the start of each loop
            // an opacity of 1 is "neutral"
            Text("Hello").animate().fade(), // begin=0, end=1
            Text("Hello").animate().fade(begin: 0.5), // end=1
            Text("Hello").animate().fade(end: 0.5), // begin=1
            Text('Hello').animate().tint(color: Colors.purple),
            Text("Hello")
                .animate()
                .fadeIn(duration: 600.ms)
                .then(delay: 200.ms) // baseline=800ms
                .slide(),
            Column(
                children: AnimateList(
              interval: 400.ms,
              effects: [FadeEffect(duration: 300.ms)],
              children: [Text("Hello"), Text("World"), Text("Goodbye")],
            )),

// or shorthand:
            Column(
              children: [Text("Hello"), Text("World"), Text("Goodbye")]
                  .animate(interval: 400.ms)
                  .fade(duration: 300.ms),
            ),
            Text("Hello World").animate().custom(
                duration: 300.ms,
                builder: (context, value, child) => Container(
                      color: Color.lerp(Colors.red, Colors.blue, value),
                      padding: EdgeInsets.all(8),
                      child: child, // child is the Text widget being animated
                    )),
            Text("Before")
                .animate()
                .swap(duration: 900.ms, builder: (_, __) => Text("After"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
