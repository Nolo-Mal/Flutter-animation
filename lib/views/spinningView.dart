import 'package:flutter/material.dart';

class SpinningView extends StatefulWidget {
  const SpinningView({super.key, required this.title});
  final String title;
  @override
  State<SpinningView> createState() => _SpinningViewState();
}

class _SpinningViewState extends State<SpinningView>
    with TickerProviderStateMixin {
  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 2,
  );

  late AnimationController _controller;

  bool _first = true;
  String textHolder = 'Spin';
  changeText() {
    setState(() {
      textHolder = 'Stop';
    });
  }

  changeTextAgain() {
    setState(() {
      textHolder = 'Stop';
    });
  }

  initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 15), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RotationTransition(
              turns: turnsTween.animate(_controller),
              child: Container(
                child: Image.asset(
                  'images/wethinkcode_.jpg',
                  width: 200,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_first) {
                  _controller.repeat();
                } else {
                  _controller.stop();
                }
                changeText();
                _first = !_first;
              },
              child: Text(_first ? "Spin" : "Stop"),
            )
          ],
        ),
      ),
    );
  }
}
