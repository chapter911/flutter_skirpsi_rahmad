import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_rahmad/helper/constant.dart';
import 'package:skripsi_rahmad/style/style.dart';

class DivisionPage extends StatefulWidget {
  const DivisionPage({super.key});

  @override
  State<DivisionPage> createState() => _DivisionPageState();
}

class _DivisionPageState extends State<DivisionPage> {
  final TextEditingController _division = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Divisi"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              clipBehavior: Clip.antiAlias,
              titlePadding: EdgeInsets.zero,
              title: Container(
                padding: const EdgeInsets.all(5),
                color: warnaPrimary,
                child: const Center(
                  child: Text(
                    "Input Divisi",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              content: TextField(
                controller: _division,
                decoration: Style().dekorasiInput(hint: "Divisi"),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Batal"),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Simpan"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
