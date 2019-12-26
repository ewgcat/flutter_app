import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'BrandHouse.dart';
import 'MinePage.dart';
class MainPage extends StatefulWidget { 
@override
State<StatefulWidget> createState() {  
 return _MainPage();
}
}
class _MainPage extends State<MainPage> with SingleTickerProviderStateMixin {
  PageController pageController; 
  int page = 0; 
  @override
  Widget build(BuildContext context) {  
   return MaterialApp(
    home: Scaffold(
     body: new PageView(
      children: <Widget>[HomePage(), BrandHouse(), MinePage()],
      controller: pageController,
       physics: NeverScrollableScrollPhysics(),
       onPageChanged: onPageChanged,
    ),
    bottomNavigationBar: BottomNavigationBar(
     items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
      BottomNavigationBarItem(icon: Icon(Icons.branding_watermark), title: Text('品牌馆')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
     ],
     onTap: onTap,
     currentIndex: page,
    ),
   ));
  } 
  @override
  void initState() {  
   super.initState();
   pageController = PageController(initialPage: this.page);
  } 
  @override
  void dispose() {
   super.dispose();
   pageController.dispose(); 
  } 
   
  void onTap(int index) {
   pageController.animateToPage(index,
     duration: const Duration(milliseconds: 300), curve: Curves.ease);
  } 
  
  void onPageChanged(int page) {
   setState(() {   
    this.page = page;
   });
  }
}