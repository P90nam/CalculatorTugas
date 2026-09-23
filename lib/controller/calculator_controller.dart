import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var hasilhitung = 0.0.obs;
  void tambahan(double a, double b) {
    double hasiltambah = a + b;
    hasilhitung.value = hasiltambah;
    Get.snackbar('Hasil', 'Hasil penjumlahan: $hasiltambah',
        snackPosition: SnackPosition.BOTTOM);
  }
  void pengurangan(double a, double b) {
    double hasilkurang = a - b;
    hasilhitung.value = hasilkurang;
    Get.snackbar('Hasil', 'Hasil pengurangan: $hasilkurang',
        snackPosition: SnackPosition.BOTTOM);
  }
  void perkalian(double a, double b) {
    double hasilkali = a * b;
    hasilhitung.value = hasilkali;
    Get.snackbar('Hasil', 'Hasil perkalian: $hasilkali',
        snackPosition: SnackPosition.BOTTOM);
  }
  void pembagian(double a, double b) {
    if (b == 0 || a == 0) {
      hasilhitung.value = double.infinity; 
      Get.snackbar('Error', 'Gagal pembagian, tidak bisa membagi dengan nol',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      double hasilbagi = a / b;
      hasilhitung.value = hasilbagi;
      Get.snackbar('Hasil', 'Hasil pembagian: $hasilbagi',
          snackPosition: SnackPosition.BOTTOM);
    }
  } 
}