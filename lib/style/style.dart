import 'package:flutter/material.dart';

class Style {
  InputDecoration dekorasiInput({hint, icon, fill}) {
    return InputDecoration(
      hintText: hint ?? "",
      prefixIcon: icon,
      filled: true,
      fillColor: fill ?? Colors.black12,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
    );
  }

  BoxDecoration dekorasiDropdown({Color? warnaFill}) {
    return BoxDecoration(
      color: warnaFill ?? Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black),
    );
  }
}
