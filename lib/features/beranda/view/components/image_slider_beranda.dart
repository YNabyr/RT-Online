// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSliderBeranda extends StatefulWidget {
  const ImageSliderBeranda({super.key});

  @override
  State<ImageSliderBeranda> createState() => _ImageSliderBerandaState();
}

class _ImageSliderBerandaState extends State<ImageSliderBeranda> {
  final List<String> imageUrls = [
    "https://th.bing.com/th/id/R.a304f4bb37a697c3b65d11d2061bb8a7?rik=qBBboYdWH2cHDA&riu=http%3a%2f%2f1.bp.blogspot.com%2f-dsw4LLX8bn8%2fUou-FaTnhSI%2fAAAAAAAAAvE%2fF58CE65T0xo%2fs1600%2fGambar%2bPemandangan%2bAlam%2bTerindah%2bDi%2bDunia%2b2014.jpg&ehk=LtOsw%2fStU7fzh1E6DaUZAPYLpsAorwCzKF74nh0B2gQ%3d&risl=&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/R.199a3b217f47c915ddbb59dabdc8149c?rik=oNrgRbhOOK3Smw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-bUTz-VYcgYs%2fUQZ4VFhxyVI%2fAAAAAAAAAO4%2fVYFd7bKcZlQ%2fs1600%2fGambar%2bgambar%2bpemandangan%2bindah%2b5.jpg&ehk=f0hH2wCR%2bOtFjO2Fnw8BZ0kJGsxlXZix3tcilBzZNKs%3d&risl=&pid=ImgRaw&r=0",
    "https://2.bp.blogspot.com/-DV2zm83hsqk/UxVt97Ou-oI/AAAAAAAAKt4/9vri4G7mBkE/s1600/Alam10.jpg",
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Slider
        CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: true,
            autoPlay: true,
            height: 177.w,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),

          // Image
          items: imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: 382.w,
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: DotsIndicator(
            dotsCount: imageUrls.length,
            position: _currentIndex,
            decorator: const DotsDecorator(
                color: Color(0xffE0E2EB), // Inactive dot color
                activeColor: Color(0xff6D6F78) // Active dot color
                ),
          ),
        ),
      ],
    );
  }
}
