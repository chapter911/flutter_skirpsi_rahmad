import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_rahmad/helper/api.dart';
import 'package:skripsi_rahmad/helper/constant.dart';
import 'package:skripsi_rahmad/helper/sharedpreferences.dart';
import 'package:skripsi_rahmad/page/admin/admin_page.dart';
import 'package:skripsi_rahmad/page/employee/employee_page.dart';
import 'package:skripsi_rahmad/page/manager/manager_page.dart';
import 'package:skripsi_rahmad/style/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (Prefs.checkData("username") == true) {
        String role = Prefs.readString("role")!;

        if (role == "1") {
          Get.offAll(() => const AdminPage());
        } else if (role == "2") {
          Get.offAll(() => const ManagerPage());
        } else {
          Get.offAll(() => const EmployeePage());
        }
      } else {
        _isLoading = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/app_logo.png',
              scale: 3,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "NAMA APLIKASI?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            _isLoading
                ? const CupertinoActivityIndicator()
                : SizedBox(
                    width: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _username,
                          decoration: Style().dekorasiInput(
                            hint: "USERNAME",
                            icon: const Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _password,
                          obscureText: true,
                          decoration: Style().dekorasiInput(
                            hint: "PASSWORD",
                            icon: const Icon(Icons.vpn_key),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_username.text.isEmpty ||
                                  _password.text.isEmpty) {
                                Get.snackbar(
                                  "Maaf",
                                  "Anda Belum Mengisi Form Login Anda",
                                );
                              } else {
                                Api.postData(context, "users/login", {
                                  "username": _username.text,
                                  "password": _password.text,
                                }).then((value) {
                                  if (value!.status == "success") {
                                    Prefs().saveString(
                                        "username", value.data![0]['username']);
                                    Prefs().saveString(
                                        "name", value.data![0]['name']);
                                    Prefs().saveString(
                                        "email", value.data![0]['email']);
                                    Prefs().saveString(
                                        "role", value.data![0]['role']);
                                    if (value.data![0]['role'] == "1") {
                                      Get.offAll(() => const AdminPage());
                                    } else if (value.data![0]['role'] == "2") {
                                      Get.offAll(() => const ManagerPage());
                                    } else {
                                      Get.offAll(() => const EmployeePage());
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: warnaPrimary,
                            ),
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
