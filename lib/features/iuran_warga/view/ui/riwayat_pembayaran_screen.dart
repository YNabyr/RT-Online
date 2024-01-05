import 'package:flutter/material.dart';
import 'package:venturo_core/features/iuran_warga/view/components/top_bar_iuran_warga.dart';

class RiwayatPembayaranScreen extends StatelessWidget {
  const RiwayatPembayaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffeff0f5),
      body: Column(
        children: [
          // Topbar
          TopBarIuranWarga(
            suffixIcon: Icons.filter_list_outlined,
          )
        ],
      ),
    );
  }
}
