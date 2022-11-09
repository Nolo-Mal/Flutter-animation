import 'package:flutter/material.dart';
import 'package:funky_app/views/spinningView.dart';

import 'jumpingJackView.dart';

class FunkyHomeView extends StatefulWidget {
  const FunkyHomeView({super.key, required this.title});
  final String title;
  @override
  State<FunkyHomeView> createState() => _FunkyHomeViewState();
}

class _FunkyHomeViewState extends State<FunkyHomeView> {
  double _width = 200;
  double _height = 250;

  _updateState() {
    if (_width == 200) {
      setState(() {
        _width = 400;
        _height = 450;
      });
    } else {
      setState(() {
        _width = 200;
        _height = 250;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          child: Text(
            'Spin',
            style: TextStyle(color: Colors.amber, fontSize: 12),
          ),
          onPressed: () {
            _openSpinningView(context);
          },
        ),
        actions: [
          ElevatedButton(
            child: Text(
              'Jumping',
              style: TextStyle(color: Colors.amber, fontSize: 12),
            ),
            onPressed: () {
              _openJumpingJackView(context);
            },
          ),
        ],
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              color: Colors.white,
              duration: Duration(seconds: 1),
              width: _width,
              height: _height,
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: Image.asset(
                  'images/wethinkcode_.jpg',
                  // width: _width,
                  // height: _height,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _updateState(),
              child: const Icon(Icons.zoom_in),
            )
          ],
        ),
      ),
    );
  }

  _openSpinningView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SpinningView(
                title: 'Spin Spin Spin',
              )),
    );
  }

  _openJumpingJackView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => JumpingJackView(
                title: 'Jumping Jack',
              )),
    );
  }
}
