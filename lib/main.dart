import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Slider(),
  ));
}


class Slider extends StatefulWidget {
  Slider({Key? key}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  final List<List<String>> slides = [
    [
      'assets/img/slide1.jpg',
      'FOR THE MINIMALISTS',
      'Matching Simplicity and Comfort for your daily basic needs'
    ],
    [
      'assets/img/slide2.jpg',
      'HUSTLE IN STYLE',
      'Matching Simplicity and Comfort for your'
    ],
    [
      'assets/img/slide3.jpg',
      'EXCLUSIVE SPORTS WEAR',
      'Matching Simplicity and Comfort for your daily basic'
    ],
  ];

  int currentSlide = 0;
  void _next(){
    setState(() {
      if(currentSlide < slides.length - 1){
        currentSlide++;
      }else{
        currentSlide = currentSlide;
      }
    });
  }

  void _prev(){
    setState(() {
      if (currentSlide > 0) {
        currentSlide--;
      } else {
        currentSlide = 0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details){
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  _prev();
                } else if(details.velocity.pixelsPerSecond.dx < 0) {
                  _next();
                }
              },
              child: Container(
                width: double.infinity,
                height: 560,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(slides[currentSlide][0]),
                    fit: BoxFit.cover
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                      Colors.black26.withOpacity(0.7),
                      Colors.black87.withOpacity(0.2)
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 55,
                        margin: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          children: _buildIndicator(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(slides[currentSlide][1]),
                  Text(slides[currentSlide][2]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive){
    return Expanded(child: 
      Container(
        height: 8,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: isActive ? Colors.white : Colors.white.withOpacity(0.4)
        )
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < slides.length; i++) {
      if(currentSlide == i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}