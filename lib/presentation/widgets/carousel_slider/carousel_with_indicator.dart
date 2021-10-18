// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:moharekcustomer/utils/app_colors.dart';


// List<T> map<T>(List list, Function handler) {
//   List<T> result = [];
//   for (var i = 0; i < list.length; i++) {
//     result.add(handler(i, list[i]));
//   }

//   return result;
// }

// class CarouselWithIndicator extends StatefulWidget {
//   final bool enableDots;
//   final List<dynamic> imgList;

//   const CarouselWithIndicator({
//     required this.imgList,
//     this.enableDots: true,
//   });
//   @override
//   _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
// }

// class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       return Stack(children: [
//         CarouselSlider(
//           options: CarouselOptions(
//             height: widget.enableDots
//                 ? constraints.maxHeight * 0.9
//                 : constraints.maxHeight,
//             autoPlay: true,
//             viewportFraction: 1.0,
//             aspectRatio: MediaQuery.of(context).size.aspectRatio * 5.5,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//           ),
//           items: map<Widget>(
//               widget.imgList,
//               (index,  i) => InkWell(
//                       // onTap: () => Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => ShowingImageInFullScreen(
//                       //               imgUrl: Urls.BASE_URL + i.adImage,
//                       //             ))),
//                       child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(15.0))),
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                       child: Image.asset('assets/images/workshop.png',
//                       width: MediaQuery.of(context).size.width,
//                          fit: BoxFit.cover,)
//                       //  CachedNetworkImage(
//                       //   progressIndicatorBuilder: (context, url, progress) =>
//                       //       Center(
//                       //     child: CircularProgressIndicator(
//                       //         value: progress.progress, color: mainAppColor),
//                       //   ),
//                       //   width: MediaQuery.of(context).size.width,
//                       //   fit: BoxFit.cover,
//                       //   imageUrl: Urls.BASE_URL + i.adImage,
//                       //   errorWidget: (context, url, error) => Icon(Icons.error),
//                       // ),
//                     ),
//                   ))).toList(),
//         ),
//         widget.enableDots
//             ? Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: map<Widget>(
//                     widget.imgList,
//                     (index, url) {
//                       return Container(
//                         width: 8.0,
//                         height: 8.0,
//                         margin: EdgeInsets.symmetric(horizontal: 2.0),
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: _currentIndex == index
//                                 ? mainAppColor
//                                 : Color(0xff707070)),
//                       );
//                     },
//                   ),
//                 ),
//               )
//             : Container(),
//       ]);
//     });
//   }
// }
