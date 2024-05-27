import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_rahmad/helper/sharedpreferences.dart';
import 'package:skripsi_rahmad/login_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Admin"),
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
