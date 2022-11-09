import 'package:flutter/material.dart';
import 'package:praktika2/main.dart';
import 'package:praktika2/presentation/admin/adminMainPage.dart';
import 'package:praktika2/presentation/client/clientMainPage.dart';
import 'package:praktika2/presentation/authorization.dart';
import 'package:praktika2/presentation/registration.dart';

const String signInScreen='SignIn';
const String signUpScreen='SignUp';
const String adminNameMainPage='AdminPaage';
const String clientNameMainPage='ClientPage';
class AppRouter{
  Route<dynamic>?generateRouter(RouteSettings settings)
  {
    switch(settings.name){
      case signInScreen:{
        return MaterialPageRoute(builder: (_)=>SignIn());//SignIn
      }
      case signUpScreen:{
        return MaterialPageRoute(builder: (_)=>SignUp()); //SignUp
      }
      case adminNameMainPage:{
        return MaterialPageRoute(builder: (_)=>AdminMainPage()); //AdminPage
      }
      case clientNameMainPage:{
        return MaterialPageRoute(builder: (_)=>ClientMainPage()); //ClientPage
      }
      
    }


  }
}