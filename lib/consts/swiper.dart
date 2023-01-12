import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';

class swippering {
  static Widget swiperWidget() {
    const List<String> offerImages = [
      'assets/images/offers/s1.jpg',
      'assets/images/offers/s2.jpg',
      'assets/images/offers/s3.jpg',
      'assets/images/offers/s4.jpg',
      'assets/images/offers/s5.jpg',
      'assets/images/offers/s6.jpg',
    ];
    return Swiper(
      duration: 1200,
      autoplayDelay: 1200,
      itemCount: 5,
      autoplay: false,
      itemBuilder: (context, index) {
        return Image.asset(
          offerImages[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}
