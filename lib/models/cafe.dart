class Cafe {
  final String id;
  final String name;
  final String telephone;
  final String location;
  final String rating;
  //Can Be Null
  final String images;
  final List<String>? reviews;
  final List<int>? tags;
  final List<String>? menus;

  const Cafe(
      {this.id = '',
      this.name = '',
      this.telephone = '',
      this.location = '',
      this.rating = '',
      this.images = '',
      this.reviews = const [],
      this.tags = const [],
      this.menus = const []});
}
