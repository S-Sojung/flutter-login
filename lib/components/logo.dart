import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {

  //final은 타입을 붙이지 않아도 알아서 이해해준다.
  final title;
  //선택적 매개변수에 강제성을 줌 required
  //title이 뭐가 들어올지 모르기 때문에 const 를 지워줌
  // Logo({required this.title, Key? key}) : super(key: key);
  //하지만 하나만 넣는 핵심인 시그니처
  Logo(this.title, { Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/logo.svg",height: 70, width: 70),
        Text(
            title,
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)
        ),
      ],
    );
  }
}
