import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shcoolapp/page/authpage.dart';
import 'package:shcoolapp/page/loginpage.dart';
import 'package:shcoolapp/provider/pagenotifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //현재 페이지 설정

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageNotifier())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Consumer<PageNotifier>(
          builder: (contex, PageNotifier, child ){
            return Navigator(
              pages: [
                MaterialPage(
                    key: ValueKey(LoginPage.pageName),
                    child: LoginPage()),
                //비교연산자 써서 페이지 설정하기,
                if (PageNotifier.currentPage == AuthPage.pageName) AuthPage(),
              ],
              // 뒤로가기 버튼을 눌렀을 때 전 페이지로 가는 과정 route,
              // 결과값을 받아 전페이지로 전달 result,
              onPopPage: (route, result) {
                if (!route.didPop(result)) {
                  return false;
                }
                return true;
              },
            );

          },
        ),
      ),
    );
  }
}
