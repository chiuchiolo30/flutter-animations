import 'package:flutter/material.dart';


class DownloadingAnimation extends StatefulWidget {
  const DownloadingAnimation({super.key});

  @override
  State<DownloadingAnimation> createState() => _DownloadingAnimationState();
}

class _DownloadingAnimationState extends State<DownloadingAnimation> {

  String porcentaje = '0';

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    final width   = MediaQuery.of(context).size.width * 0.8;
    const height  = 22.0;
    final color   = Colors.lightBlue[300]!;

    return Material(
      color: Colors.black,
      child:  TweenAnimationBuilder<double>(
        duration: const Duration( milliseconds: 2000),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, _) {
          return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>  [
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    height: height,
                    width:  width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: color, width: 2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                   child: AnimatedContainer(
                    duration: const Duration( milliseconds: 500),                
                    width:  MediaQuery.of(context).size.width * value,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(color: color, width: 2),
                      borderRadius: BorderRadius.circular(10)
                   
                    ),
                    ) 
                  ),
                  const SizedBox(height: 4,),
                  Text('${(value * 100).toStringAsPrecision(3)} %', style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500 ),)
                ],
              );
        }
      )
      
       
        
    
    );
  }
}
