import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/iuran_warga/view/components/struk_pembayaran_card.dart';
import 'package:venturo_core/features/iuran_warga/view/components/top_bar_iuran_warga.dart';

class StrukPembayaranScreen extends StatelessWidget {
  const StrukPembayaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TopBar
            const TopBarIuranWarga(title: "Struk Pembayaran"),

            25.verticalSpace,

            // Card
            const StrukPembayaranCard(),

            33.verticalSpace,

            // Button bagikan
            SizedBox(
              width: 382.w,
              height: 54.w,
              child: FilledButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF094181)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                child: const Text("Bagikan"),
              ),
            ),

            21.verticalSpace,
          ],
        ),
      ),
    );
  }
}
