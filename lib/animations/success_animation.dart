import 'package:flutter/material.dart';


class SuccessAnimation extends StatefulWidget {
  const SuccessAnimation({super.key});


  @override
  State<SuccessAnimation> createState() => _SuccessAnimationState();
}

class _SuccessAnimationState extends State<SuccessAnimation> {

  bool start = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 400), () => setState(() => start = true));
    
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: OverflowBox(
        maxHeight: MediaQuery.of(context).size.longestSide * 2,
        maxWidth: MediaQuery.of(context).size.longestSide * 2,
        child: AnimatedContainer(
          duration: const Duration( microseconds: 700),
          height: MediaQuery.of(context).size.longestSide * 2,
          width: MediaQuery.of(context).size.longestSide * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green[800]
          ),
          child: start ? TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration( milliseconds: 700),
            curve: Curves.elasticInOut,
            builder: (context, value, child) {
              return Transform.scale(
                scale: value + 0.1,
                child: child,
              );
            },
            child: const Icon(Icons.check, size:  200, color: Colors.white),
            ) : null,
          // child: start ? const Center(
          //   child: Icon(Icons.check, size:  200, color: Colors.white,),
          // ) : null,
          ),
      )
    );
  }
}
