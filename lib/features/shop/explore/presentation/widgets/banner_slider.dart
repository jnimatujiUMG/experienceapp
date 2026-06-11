import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {

  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() =>
      _BannerSliderState();
}

class _BannerSliderState
    extends State<BannerSlider> {

  final PageController controller =
      PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        SizedBox(
          height: 220,

          child: PageView.builder(

            controller: controller,

            itemCount: 4,

            onPageChanged: (value) {

              setState(() {
                currentPage = value;
              });
            },

            itemBuilder: (context, index) {

              return Container(
                margin:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                decoration: BoxDecoration(
                  color:
                      const Color(0xFFDCE3EE),

                  borderRadius:
                      BorderRadius.circular(
                    24,
                  ),
                ),

                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: List.generate(
            4,
            (index) {

              return AnimatedContainer(
                duration:
                    const Duration(
                  milliseconds: 300,
                ),

                margin:
                    const EdgeInsets.symmetric(
                  horizontal: 4,
                ),

                width:
                    currentPage == index
                        ? 10
                        : 8,

                height:
                    currentPage == index
                        ? 10
                        : 8,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color:
                      currentPage == index
                          ? Colors.blue
                          : Colors.grey
                              .shade300,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}