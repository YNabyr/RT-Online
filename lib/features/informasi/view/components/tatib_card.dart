import 'package:flutter/material.dart';
import 'package:venturo_core/features/informasi/view/components/tatib_content.dart';
import 'package:venturo_core/features/informasi/view/components/tatib_headline.dart';

class TatibCard extends StatelessWidget {
  const TatibCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TatibHeadline(),
        TatibContent(),
      ],
    );
  }
}
