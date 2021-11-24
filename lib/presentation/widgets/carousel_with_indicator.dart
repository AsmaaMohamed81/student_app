import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:student_app/utils/app_colors.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  final bool enableDots;
  final List<dynamic>? imgList;

  const CarouselWithIndicator({Key? key, this.imgList, this.enableDots = true})
      : super(key: key);
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.enableDots
                ? constraints.maxHeight * 0.9
                : constraints.maxHeight,
            autoPlay: true,
            viewportFraction: 1.0,
            aspectRatio: MediaQuery.of(context).size.aspectRatio * 5.5,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: map<Widget>(
              widget.imgList!,
              (index, i) => Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      child: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                              value: progress.progress, color: mainAppColor),
                        ),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        imageUrl: 'path',
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  )).toList(),
        ),
        widget.enableDots
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(
                    widget.imgList!,
                    (index, url) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? mainAppColor
                                : const Color(0xff707070)),
                      );
                    },
                  ),
                ),
              )
            : Container(),
      ]);
    });
  }
}
