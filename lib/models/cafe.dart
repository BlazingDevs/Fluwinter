class Cafe{
  final String name;
  final String telephone;
  final String location;
  final num rating;
  //Can Be Null
  final List<String>? images;
  final List<String>? reviews;
  final List<String>? tags;
  final List<String>? menus;

  const Cafe({ this.name = '', this.telephone = '', this.location  = '', this.rating = 0, this.images = const [], this.reviews = const [], this.tags = const [], this.menus = const [] });
}