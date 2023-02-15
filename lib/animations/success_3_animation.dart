import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';


class Success3Animation extends StatefulWidget {
  const Success3Animation({super.key});


  @override
  State<Success3Animation> createState() => _Success3AnimationState();
}

class _Success3AnimationState extends State<Success3Animation> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;


  final h = 40.0;
  bool  curve = false;

  bool completed = false;


  
  @override
  void initState() {

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    Future.delayed(const Duration(milliseconds: 700), () => _animationController.forward());
    _animationController.addStatusListener((status) { 
      if (status == AnimationStatus.dismissed && completed) {
        
      }
    });
    super.initState();
  } 

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    final size  = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
          Align(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                
                double widthc1   = width;
                double widthc2   = 0.0001;
                double minHeight = h;

                if (_animationController.value == 1.0) {
                  widthc1 = 60.0;
                  minHeight = 60;
                }
       
                if (_animationController.status == AnimationStatus.forward) {
                  widthc2 = width * _animationController.value;
                } 

                return ClipRRect(
                  borderRadius: BorderRadius.circular( completed ? 60 : 10),
                  child: AnimatedContainer(
                    onEnd:() {

                      setState(() {
                         completed = true;
                      });
                    },
                    curve: Curves.easeInBack,
                    alignment:Alignment.topLeft,
                    height: minHeight,
                    width:  widthc1,
                    decoration: BoxDecoration(color: Colors.blue.withOpacity( 0.5)),
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      decoration: BoxDecoration( color: completed ? Colors.greenAccent[700] : Colors.blue),
                      height: completed   ?  widthc1 : null,
                      width:  !completed  ?  widthc2 : widthc1,
                      child:  completed   ? TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        curve: Curves.elasticInOut,
                        builder: (BuildContext context, value, Widget? child) { 
                          return Transform.scale(
                            scale: value,
                            child: child
                          );
                         },
                        
                        duration: const Duration(milliseconds: 600),
                        child: const Icon(Icons.check, color: Colors.white, size: 40,)
                      ) : null,
                    ),
                  ),
                );
              }
            ),
          )
       
        ],
      )
    );
  }
}
