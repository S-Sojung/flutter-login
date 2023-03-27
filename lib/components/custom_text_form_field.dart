import 'package:flutter/material.dart';
import 'package:flutter_login/components/my_input_decoration.dart';
import 'package:flutter_login/size.dart';

class CustomTextFormField extends StatelessWidget {

  //시그니처 외에는 final을 다 붙이고..
  //
  final title;
  final bool isObscure;

  const CustomTextFormField(this.title,{this.isObscure = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: s_gap),
        TextFormField(
          validator: (value) =>
            value!.isEmpty ? "Please Enter some text" : null
          //value! 는 절대 null 이 아니에요 라는 의미
          //전송을 누를 때 값을 체크함  //null은 유효성 체크 통과
          //value가 없으면 이하 스트링을 출력하라
          ,
          // onChanged: (text){
          //   print(text);
          // },
          obscureText: isObscure,
          // decoration: InputDecoration(//여기에 뭘 넣어야하는지... 추상클래스인지..
          decoration: MyInputDecoration( //직접 만들어서 사용 가능
            "Enter $title",

          ),
        ),
      ],
    );
  }
}
