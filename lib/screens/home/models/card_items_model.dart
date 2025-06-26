class CardItemsModel {
  CardItemsModel({
    required this.urlPath,
    required this.title,
    required this.priceAfter,
    required this.priceBefore,
    required this.discount,
  });
  final String urlPath, title, priceAfter, priceBefore, discount;

  static List<CardItemsModel> cardItems = [
    CardItemsModel(
      urlPath:
          "https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?uid=R162128033&ga=GA1.1.532573241.1750409140&semt=ais_items_boosted&w=740",
      discount: "10",
      priceAfter: "229",
      priceBefore: "349",
      title: "Sports Tools",
    ),
    CardItemsModel(
      urlPath:
          "https://img.freepik.com/free-vector/sport-equipment-concept_1284-13034.jpg?uid=R162128033&ga=GA1.1.532573241.1750409140&semt=ais_items_boosted&w=740",
      discount: "20",
      priceAfter: "200",
      priceBefore: "300",
      title: "Sports Tools",
    ),
    CardItemsModel(
      urlPath:
          "https://img.freepik.com/premium-photo/tv-cabinet-modern-living-room-with-plant-white-wall_41470-1284.jpg?uid=R162128033&ga=GA1.1.532573241.1750409140&semt=ais_items_boosted&w=740",
      discount: "15",
      priceAfter: "5899.99",
      priceBefore: "6199.99",
      title: "Electronic Tools",
    ),
    CardItemsModel(
      urlPath:
          "https://img.freepik.com/free-photo/front-view-stacked-books-ladders-with-copy-space-education-day_23-2149241015.jpg?uid=R162128033&ga=GA1.1.532573241.1750409140&semt=ais_items_boosted&w=740",
      discount: "10",
      priceAfter: "100",
      priceBefore: "249",
      title: "Books",
    ),
  ];
}
