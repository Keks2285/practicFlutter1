import 'package:praktika2/data/repositories/auth_repositories_impl.dart';
import 'package:praktika2/domain/usecase/auth.dart';
import 'package:praktika2/custom_widgets/text_field_obscure.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _middleNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Text(
                  'Регистрация',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26),
                ),
                const Spacer(),
                TextFormField(
                  style: TextStyle( color: Colors.yellow),
                  maxLength: 30,
                  controller: _lastNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Поле фамилии пустое';
                    }
                    if (value.length < 5) {
                      return 'Фамилия не может быть меньше 5 символов';
                    }
                    if (!validationFIO(value)) {
                      return 'Фамилия пишется с большой буквы и содержит только кириллицу';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Фамилия',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                 style: TextStyle( color: Colors.yellow),
                  maxLength: 30,
                  controller: _firstNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Поле имени пустое';
                    }
                    if (value.length < 2) {
                      return 'Имя не может быть меньше двух символов';
                    }
                    if (!validationFIO(value)) {
                      return 'Имя пишется с большой буквы и содержит только кириллицу';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Имя',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: TextStyle( color: Colors.yellow),
                  maxLength: 30,
                  controller: _middleNameController,
                  validator: (value) {
                    if (value!.isNotEmpty && !validationFIO(value)) {
                      return 'Отчество пишется с большой буквы и содержит только кириллицу';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Отчество (необязательное поле)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: TextStyle( color: Colors.yellow),
                  maxLength: 15,
                  controller: _loginController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Поле логин пустое';
                    }
                    if (value.length < 3) {
                      return 'Логин должен быть не менее 3 символов';
                    }
                    if (!validationLogin(value)) {
                      return 'Логин должен содержать только латиницы и начинаться с большой буквы';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Логин',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: TextStyle( color: Colors.yellow),
                  maxLength: 20,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Поле пароль пустое';
                    }
                    if (value.length < 8) {
                      return 'Пароль должен быть длинной 8 символов';
                    }
                    if (!validationPassword(value)) {
                      return 'Пароль должен содеражать 1 букву верхнего регистра, одну нижнего и один спецсимвол ( ! @ # \$ & * ~ )';
                    }
                    return null;
                  },
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    hintText: 'Пароль',
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
                  child: Text('Регистрация'),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      signUp();
                    } else {}
                  },
                ),
                const Spacer(flex: 3),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    final AuthRepositoriesImpl auth = AuthRepositoriesImpl();

    var result = await Auth(auth).signUp(RegistrationParams(
        lastName: _lastNameController.text,
        firstName: _firstNameController.text,
        middleName: _middleNameController.text,
        login: _loginController.text,
        password: _passwordController.text));

    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
        ),
      );
    }, (r) {
      Navigator.pop(context);
    });
  }

  bool validationPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }


  bool validationFIO(String value) {
    String pattern = r'[А-Я][-а-я]+';
    RegExp regExp = new RegExp(pattern);
    String patternDights = r'[0-9]';
    RegExp regExpDights = new RegExp(patternDights);
    bool b = !regExpDights.hasMatch(value);
    bool a= regExp.hasMatch(value);
    return a&&b;
  }

  bool validationLogin(String value) {
    String patternAlph = r'[A-Z][-a-z]+';
    String patternDights = r'[0-9]';
    RegExp regExp = new RegExp(patternAlph);
    RegExp regExpDights = new RegExp(patternDights);
    bool b = !regExpDights.hasMatch(value);
    bool a = regExp.hasMatch(value);
    return a && b;
  }
}
