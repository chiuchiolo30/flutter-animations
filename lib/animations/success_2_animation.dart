import 'dart:ui';

import 'package:flutter/material.dart';


class Success2Animation extends StatefulWidget {
  const Success2Animation({super.key});


  @override
  State<Success2Animation> createState() => _Success2AnimationState();
}

class _Success2AnimationState extends State<Success2Animation> {

  bool start = false;

  final _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 400), () => setState(() => start = true));
    Future.delayed(const Duration(milliseconds: 1000), 
      () => _globalKey.currentState!.showBottomSheet(
        enableDrag: false,
        elevation: 2,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
        (context) 
        => Container(
          alignment: Alignment.center,
          height: 140,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:  BorderRadius.vertical(top: Radius.circular(40)),
         
          ),
          child: const Text('¡Success!', style: TextStyle(color: Colors.black, fontSize: 16),),
        ))
    );
    
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _globalKey,
      body: OverflowBox(
        maxHeight: MediaQuery.of(context).size.longestSide * 2,
        maxWidth: MediaQuery.of(context).size.longestSide * 2,
        child: AnimatedContainer(
          duration: const Duration( microseconds: 700),
          height: MediaQuery.of(context).size.longestSide * 2,
          width: MediaQuery.of(context).size.longestSide * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.greenAccent[700]
          ),
          child: start ? Align(
            alignment: Alignment.center,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.3),
                    shape: BoxShape.circle
                  ),
                  child: TweenAnimationBuilder(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration( milliseconds: 700),
                    curve: Curves.elasticInOut,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value + 0.1,
                        child: child,
                      );
                    },
                     child: const Icon(Icons.check, size:  90, color: Colors.white),
                  ),
                ),
              ),
            ),
          ) : null,          
          ),
      )
    );
  }
}
