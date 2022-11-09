import 'package:praktika2/app_route.dart';
import 'package:praktika2/data/repositories/auth_repositories_impl.dart';
import 'package:praktika2/domain/entity/role_entity.dart';
import 'package:praktika2/domain/usecase/auth.dart';
import 'package:flutter/material.dart';
import 'package:praktika2/custom_widgets/text_field_obscure.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(child: SizedBox()),
                const Text(
                  'IKEA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      backgroundColor: Color.fromARGB(255, 4, 77, 136),
                      color: Colors.yellow),
                ),
                const Expanded(child: SizedBox()),
                TextFormField(
                  controller: _loginController,
                  validator: (value) {
                    if (!_isValid) {
                      return null;
                    }
                    if (value!.isEmpty) {
                      return 'Введите логин';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Логин',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (!_isValid) {
                      return null;
                    }
                    if (value!.isEmpty) {
                      return 'Введите пароль';
                    }
                    return null;
                  },
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    suffixIcon: TextFieldObscure(isObscure: (value) {
                      setState(() {
                        isObscure = value;
                      });
                    }),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: Text(
                    'Войти',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(300, 50),
                      backgroundColor: Color.fromARGB(255, 4, 77, 136),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    _isValid = true;
                    if (_key.currentState!.validate()) {
                      signIn();
                    } else {}
                  },
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: ElevatedButton(
                    
                    child: Text(
                      'Регистрация',
                      style: TextStyle(color: Colors.yellow),
                    ),
                    style: ElevatedButton.styleFrom(
                      
                        fixedSize: Size(150, 40),
                        backgroundColor: Color.fromARGB(255, 4, 77, 136),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      _loginController.clear();
                      _passwordController.clear();
                      _isValid = false;
                      _key.currentState!.validate();
                      Navigator.pushNamed(context, signUpScreen);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    final AuthRepositoriesImpl auth = AuthRepositoriesImpl();
    var result = await Auth(auth).signIn(AuthParams(
      login: _loginController.text,
      password: _passwordController.text,
    ));
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
        ),
      );
    }, (r) {
      switch (r) {
        case RoleEnum.admin:
          {
            Navigator.pushNamed(context, adminNameMainPage);
//print('admin');
            break;
          }
        case RoleEnum.user:
          Navigator.pushNamed(context, clientNameMainPage);
//print('client');
          break;
      }
    });
  }
}
