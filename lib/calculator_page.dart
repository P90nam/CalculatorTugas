import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'component/custom_button.dart';
import 'component/custom_textfield.dart';
import 'controller/calculator_controller.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});
  final controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    final txtAngka1 = TextEditingController();
    final txtAngka2 = TextEditingController();

    void hitung(void Function(double, double) operasi) {
      final angka1 = double.tryParse(txtAngka1.text);
      final angka2 = double.tryParse(txtAngka2.text);

      if (angka1 == null || angka2 == null) {
        Get.snackbar(
          'Error',
          'Masukkan angka yang valid',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      operasi(angka1, angka2);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text(
          'Kalkulator',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MyTextfield(
              myHint: 'Input angka 1',
              txtController: txtAngka1,
              radius: 10,
            ),
            const SizedBox(height: 12),
            MyTextfield(
              myHint: 'Input angka 2',
              txtController: txtAngka2,
              radius: 10,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: 'Tambah',
                    onPressed: () => hitung(controller.tambahan),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    label: 'Kurangi',
                    onPressed: () => hitung(controller.pengurangan),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: 'Kali',
                    onPressed: () => hitung(controller.perkalian),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    label: 'Bagi',
                    onPressed: () => hitung(controller.pembagian),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Obx(
              () => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE6E8EC)),
                ),
                child: Text(
                  'Hasil: ${controller.hasilhitung}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF252A34),
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
                                                              