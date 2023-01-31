import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/animations.dart';


class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});


  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
        
        title: const Text('Flutter Animations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.blue,
              child: const Text('Success', style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const SuccessAnimation(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation, 
                            curve: Curves.easeInOut,
                            reverseCurve: Curves.easeInOut
                            )
                        ),
                        child: child,
                        );
                    },
                    transitionDuration: const Duration( milliseconds: 700 ),
                    reverseTransitionDuration: const Duration( milliseconds: 700)
                    )
                  );
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text('Downloading', style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DownloadingAnimation()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
