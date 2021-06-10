import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import '../../bloc/signin_bloc/signin_bloc.dart';
import '../../bloc/signin_bloc/signin_event.dart';
import '../../bloc/signin_bloc/signin_state.dart';
import '../../components/loading_dialog.dart';
import '../../components/my_form_field.dart';
import '../../components/themes_header.dart';
import '../../constants/base_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/base_environment.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isShowPassword = false;

  void initState() {
    setState(() {
      BlocProvider.of<SignInBloc>(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    //final size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInLoading) {
              loadingDialog(context: context, msg: 'Masuk..');
            }
            if (state is SignInSuccess) {
              Navigator.pop(context);
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(
                    state.message,
                    style: TextStyle(color: BaseColor.white),
                  ),
                  backgroundColor: BaseColor.white,
                ));
              Navigator.pushNamedAndRemoveUntil(
                  context, '/homeScreen', (route) => false);
            }
            if (state is SignInFailure) {
              Navigator.pop(context);
              showPlatformDialog(
                context: context,
                builder: (_) => BasicDialogAlert(
                  title: Text('Peringatan'),
                  content: Text(state.message),
                  actions: [
                    BasicDialogAction(
                      title: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(children: [
                SizedBox(height: 12.0),
                Image.asset('${BaseEnvironment.imageAssets}login.png',
                    height: 250),
                Text('Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Themes.colorHeader,
                        fontSize: 32)),
                SizedBox(height: 12.0),
                MyFormField(
                  textEditingController: _emailController,
                  hintText: 'Email',
                  prefixIcon: Icon(EvaIcons.emailOutline),
                ),
                SizedBox(height: 12.0),
                MyFormField(
                  textEditingController: _passwordController,
                  hintText: 'Password',
                  obscureText: _isShowPassword ? false : true,
                  suffixIcon: IconButton(
                    icon: Icon(_isShowPassword
                        ? EvaIcons.eyeOutline
                        : EvaIcons.eyeOff),
                    onPressed: () {
                      setState(() {
                        if (!_isShowPassword) {
                          _isShowPassword = true;
                        } else {
                          _isShowPassword = false;
                        }
                      });
                    },
                  ),
                  prefixIcon: Icon(
                    EvaIcons.lockOutline,
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Lupa password?',
                    style: TextStyle(color: BaseColor.black),
                  ),
                ),
                SizedBox(height: 24.0),
                FlatButton(
                  color: Themes.colorPrimary,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  onPressed: () {
                    context.read<SignInBloc>().add(SignInBtnPressed(
                        email: _emailController.text,
                        password: _passwordController.text,
                        deviceName: 'Mobile'));
                  },
                ),
              ]),
            );
          },
        ));
  }
}
