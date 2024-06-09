import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_rahmad/helper/api.dart';
import 'package:skripsi_rahmad/page/admin/karyawan_page.dart';
import 'package:skripsi_rahmad/style/style.dart';

class KaryawanInputPage extends StatefulWidget {
  const KaryawanInputPage({super.key});

  @override
  State<KaryawanInputPage> createState() => _KaryawanInputPageState();
}

class _KaryawanInputPageState extends State<KaryawanInputPage> {
  final TextEditingController _nik = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _id_divisi = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _tanggal_masuk = TextEditingController();
  final TextEditingController _tempat_lahir = TextEditingController();
  final TextEditingController _agama = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _no_sk = TextEditingController();
  final TextEditingController _status = TextEditingController();
  final TextEditingController _posisi = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _blokir = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Karyawan"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nik,
                decoration: Style().dekorasiInput(hint: "NIK"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _id_divisi,
                decoration: Style().dekorasiInput(hint: "id_divisi"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _alamat,
                decoration: Style().dekorasiInput(hint: "alamat"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _gender,
                decoration: Style().dekorasiInput(hint: "gender"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _tanggal_masuk,
                decoration: Style().dekorasiInput(hint: "tanggal_masuk"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _tempat_lahir,
                decoration: Style().dekorasiInput(hint: "tempat_lahir"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _agama,
                decoration: Style().dekorasiInput(hint: "agama"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _email,
                decoration: Style().dekorasiInput(hint: "email"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _no_sk,
                decoration: Style().dekorasiInput(hint: "no_sk"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _status,
                decoration: Style().dekorasiInput(hint: "status"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _posisi,
                decoration: Style().dekorasiInput(hint: "posisi"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _pass,
                decoration: Style().dekorasiInput(hint: "pass"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _blokir,
                decoration: Style().dekorasiInput(hint: "blokir"),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_nik.text.isNotEmpty &&
              _id_divisi.text.isNotEmpty &&
              _alamat.text.isNotEmpty &&
              _gender.text.isNotEmpty &&
              _tanggal_masuk.text.isNotEmpty &&
              _tempat_lahir.text.isNotEmpty &&
              _nama.text.isNotEmpty &&
              _no_sk.text.isNotEmpty &&
              _status.text.isNotEmpty &&
              _posisi.text.isNotEmpty &&
              _pass.text.isNotEmpty &&
              _blokir.text.isNotEmpty) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Konfirmasi"),
                  content:
                      const Text("Apakah Anda yakin ingin menyimpan data ini?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Batal",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                        Get.snackbar(
                          "Success",
                          "Data berhasil disimpan",
                          colorText: Colors.white,
                          backgroundColor: Colors.green[900],
                        );
                        Api.postData(context, "/add_pegawai", {
                          'nik': _nik.text,
                          'id_divisi': _id_divisi.text,
                          'alamat': _alamat.text,
                          'gender': _gender.text,
                          'tanggal_masuk': _tanggal_masuk.text,
                          'tempat_lahir': _tempat_lahir.text,
                          'nama': _nama.text,
                          'no_sk': _no_sk.text,
                          'status': _status.text,
                          'posisi': _posisi.text,
                          'pass': _pass.text,
                          'blokir': _blokir.text,
                        }).then((value) {
                          if (value != null && value.status == "success") {
                            Get.to(() => const KaryawanPage());
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                      ),
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            Get.snackbar(
              "Maaf",
              "Inputan Anda Belum Lengkap",
              colorText: Colors.white,
              backgroundColor: Colors.red[900],
            );
          }
        },
        child: const Icon(
          Icons.save,
        ),
      ),
    );
  }
}
