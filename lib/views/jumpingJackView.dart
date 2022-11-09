import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JumpingJackView extends StatefulWidget {
  const JumpingJackView({super.key, required this.title});
  final String title;
  @override
  State<JumpingJackView> createState() => _JumpingJackViewState();
}

class _JumpingJackViewState extends State<JumpingJackView>
    with SingleTickerProviderStateMixin {
  bool play = false;
  double mariox = 0;
  double marioy = 300;
  Random random = Random();

  late AnimationController _controller;

  void jump() {
    play = !play;
    setState(() {
      if (play) {
        mariox = random.nextInt(680) as double;
        marioy = random.nextInt(300) as double;
      } else {
        mariox = 0;
        marioy = 300;
      }
    });
  }

  initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 2000),
              left: mariox,
              top: marioy,
              child: Image.asset(
                'images/athletics.png',
                width: 40,
                height: 60,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 400.0),
            child: Center(
              child: FloatingActionButton.extended(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                onPressed: () => jump(),
                label: const Text('Jump'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
