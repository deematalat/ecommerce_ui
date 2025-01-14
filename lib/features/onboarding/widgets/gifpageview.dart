/*import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

class GifPageView extends StatefulWidget {
  @override
  _GifPageViewState createState() => _GifPageViewState();
}

class _GifPageViewState extends State<GifPageView> with TickerProviderStateMixin {
  final List<String> gifPaths = [
    'assets/gift1.gif',
    'assets/gift2.gif',
    'assets/gift3.gif',
  ];

  late List<FlutterGifController> _controllers;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Initialize a FlutterGifController for each GIF
    _controllers = gifPaths.map((_) {
      return FlutterGifController(vsync: this); // 'vsync' is provided by TickerProviderStateMixin
    }).toList();

    // Start the first GIF animation
    _controllers.first.repeat(min: 0, max: 30, period: Duration(seconds: 2));
  }

  @override
  void dispose() {
    // Dispose all controllers
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onPageChanged(int index) {
    // Stop the current GIF animation
    _controllers[currentPage].stop();

    // Start the new GIF animation
    setState(() {
      currentPage = index;
    });
    _controllers[currentPage].repeat(min: 0, max: 30, period: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicators
            Row(
              children: List.generate(
                gifPaths.length,
                    (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: LinearProgressIndicator(
                      value: currentPage == index ? 1.0 : 0.0,
                      color: Colors.red,
                      backgroundColor: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: _onPageChanged,
                itemCount: gifPaths.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: GifImage(
                      image: AssetImage(gifPaths[index]),
                      controller: _controllers[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/