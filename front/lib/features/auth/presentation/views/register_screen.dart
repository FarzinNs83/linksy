import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/core/widgets/app_button.dart';
import 'package:front/features/auth/presentation/views/login_screen.dart';

import '../../../../core/utils/app_ext.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/show_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../providers/auth_providers.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final nameCtrl = TextEditingController();
  final nameNode = FocusNode();
  final emailCtrl = TextEditingController();
  final emailNode = FocusNode();
  final pwCtrl = TextEditingController();
  final pwNode = FocusNode();
  final pwcCtrl = TextEditingController();
  final pwcNode = FocusNode();
  final loginNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          ShowToast().show("Register successful", context);
        },
        error: (err, stack) {
          ShowToast().show(err.toString(), context);
        },
      );
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.png.background.path),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: FadeInUp(
                      duration: Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.png.light1.path),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1200),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.png.light2.path),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.png.clock.path),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1600),
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: FadeInDown(
                            duration: Duration(seconds: 1),
                            child: Text(
                              "Welcome To Linksy!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: AppTextField(
                        validator: (p0) => p0 == null || p0.length < 3
                            ? "Name must be at least 3 characters"
                            : null,
                        ctrl: nameCtrl,
                        focusNode: nameNode,
                        hintText: 'Please Enter Name',
                        prefixIcon: Icon(Icons.person_2),
                      ),
                    ),
                    12.height,
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: AppTextField(
                        validator: (p0) => p0 == null || p0.isEmpty
                            ? "Email can't be empty"
                            : null,
                        ctrl: emailCtrl,
                        focusNode: emailNode,
                        hintText: 'Please Enter Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    12.height,
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: AppTextField(
                        validator: (p0) => p0 == null || p0.isEmpty
                            ? "PW can't be empty"
                            : null,
                        obsecure: true,
                        ctrl: pwCtrl,
                        focusNode: pwNode,
                        hintText: "Please Enter Pw",
                        prefixIcon: Icon(Icons.password_rounded),
                      ),
                    ),
                    12.height,
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: AppTextField(
                        validator: (p0) => pwcCtrl.text == pwCtrl.text
                            ? null
                            : "Wrong Password",
                        obsecure: true,
                        ctrl: pwcCtrl,
                        focusNode: pwcNode,
                        hintText: "Please Confirm Your Pw",
                        prefixIcon: Icon(Icons.verified),
                      ),
                    ),
                    30.height,
                    FadeInUp(
                      duration: Duration(milliseconds: 1900),
                      child: AppButton(
                        title: "Register",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await ref
                                .read(authControllerProvider.notifier)
                                .register(
                                  emailCtrl.text,
                                  pwCtrl.text,
                                  nameCtrl.text,
                                );
                          }
                        },
                        focusNode: loginNode,
                      ),
                    ),
                    SizedBox(height: 70),
                    FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      child: Text.rich(
                        WidgetSpan(
                          child: Row(
                            mainAxisAlignment: .center,
                            spacing: 4,
                            children: [
                              Text(
                                "Already have an account?",
                                style: context.textTheme.bodyLarge!,
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.navigateR(LoginScreen());
                                },
                                child: Text(
                                  "Login Now",
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    color: context.colors.primary,
                                    fontSize: 18,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
