import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_rahmad/helper/sharedpreferences.dart';
import 'package:skripsi_rahmad/login_page.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Karyawan"),
        actions: [
          IconButton(
            onPressed: () {
              Prefs().clearData();
              Get.offAll(() => const LoginPage());
            },
            icon: const Icon(Icons.power_settings_new),
          ),
        ],
      ),
    );
  }
}
