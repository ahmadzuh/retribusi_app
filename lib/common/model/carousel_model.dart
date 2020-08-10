class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "assets/slide/carousel_flight_discount.png"},
  {"image": "assets/slide/carousel_hotel_discount.png"},
  {"image": "assets/slide/carousel_covid_discount.png"},
];
