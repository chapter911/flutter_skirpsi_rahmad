import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_rahmad/helper/constant.dart';
import 'package:skripsi_rahmad/helper/sharedpreferences.dart';
import 'package:skripsi_rahmad/login_page.dart';
import 'package:skripsi_rahmad/page/admin/karyawan_page.dart';

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
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (1 / 0.7),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => const KaryawanPage());
              },
              child: Card(
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/app_logo.png",
                            scale: 5,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Expanded(
                          child: Container(
                            color: warnaPrimary,
                            height: double.maxFinite,
                            child: const Center(
                              child: Text(
                                "KARYAWAN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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
    );
  }
}
