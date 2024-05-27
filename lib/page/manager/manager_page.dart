import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_rahmad/helper/sharedpreferences.dart';
import 'package:skripsi_rahmad/login_page.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({super.key});

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Manager"),
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
