import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlashMessageScreen extends StatelessWidget {
  const FlashMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: CustomSnackBarContent(errorText: "That Password address is already in use! Please try with a different one"),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
              )
              );
        },
        child: const Text("Show Message"),
      )),
    );
  }
}

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    required this.errorText,
    Key? key,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: Color(0xFFC72C41),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              SizedBox(width: 48,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Oh snap!", style: TextStyle(fontSize: 18, color: Colors.white),),
                    Spacer(),
                    Text(errorText, style: TextStyle(fontSize: 14, color: Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ],
          )
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: SvgPicture.asset("assets/icons/bubbles.svg", height: 48, width: 40, color: Color(0xFF801336),))
              ),
            Positioned(
              top: -20,
              left: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset("assets/icons/fail.svg", height: 40,),
                  Positioned(
                    top: 10,
                    child: SvgPicture.asset("assets/icons/close.svg", height: 16,)),
                  
                ],
              ))
      ],
    );
  }
}
