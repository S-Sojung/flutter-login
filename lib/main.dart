import 'package:flutter/material.dart';
import 'package:flutter_login/components/custom_text_form_field.dart';
import 'package:flutter_login/components/logo.dart';
import 'package:flutter_login/size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //계속 달라질 것이기 때문에 const 제거
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            // 어떤 위젯들은 보통 기본적으로 들고있는 디자인들이 있음
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            minimumSize: Size(double.infinity, 60)
            //가로는 무한대 확장 double.infinity 혹은 미디어쿼리 / 세로는 적당히 조절
            //그리고 얘를 감싸는 박스로 크기가 조절될 것이다.
            ),
      )),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login", //최초 페이지 주소
      routes: {
        //생성자에 초기값(데이터가)이 들어가야하면 계속 바뀌는 페이지이기 때문에 const 붙일 수 없다.
        //하지만 항상 똑같은 페이지일 경우 const를 붙여야한다.
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {

  //폼 태그를 이용해서 데이터를 연결하고 싶다면
  final _formKey = GlobalKey<FormState>();
  //1. GlobalKey를 만들 것 = 폼의 상태를 알 수 있는 키를 만들 것
  //ㄱ값을 들고올려면 Editing 어쩌구 해주면된다.

  LoginPage({Key? key}) : super(key: key);
  //폼의 상태를 확인하려면 변화하는 값을 확인해야하기 때문에 const를 못붙힌다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // 폼필드를 사용하면 키보드(인셋)가 생성되기 때문에 화면이 일그러질수 있다.
          // 하면을 압축 하던가, 리스트 뷰를 해줘야한다.
          children: [
            SizedBox(height: xl_gap,),
            Logo("Login"),
            Form(
              key: _formKey, //2. GlobalKey를 연결한다.
              child: Column(
                children: [
                  CustomTextFormField("email"),
                  SizedBox(height: m_gap,),
                  CustomTextFormField("password", isObscure: true),
                  SizedBox(height: l_gap,),
                  TextButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          Navigator.pushNamed(context, "/home");
                        }
                      },
                      child: Text("Login")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo("Care Soft"),
            SizedBox(height: l_gap,),
            TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, "/login");
                  Navigator.pop(context);
                },
                child: Text("Get Started")),
          ],
        ),
      ),
    );
  }
}
