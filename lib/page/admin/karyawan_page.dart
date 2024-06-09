import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_rahmad/page/admin/karyawan_input_page.dart';

class KaryawanPage extends StatefulWidget {
  const KaryawanPage({super.key});

  @override
  State<KaryawanPage> createState() => _KaryawanPageState();
}

class _KaryawanPageState extends State<KaryawanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Karyawan"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const KaryawanInputPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
