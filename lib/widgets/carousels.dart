class CarouselModel {
  String? image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "assets/images/1.png"},
  {"image": "assets/images/2.png"},
  {"image": "assets/images/3.png"},
];
