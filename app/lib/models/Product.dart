class Product {
  String name;
  String description;
  int ProductID;
  int price;
  List<String> images;
  String cover_image;
  int stock;
  int rating;
  int reviews_count;
  List<String> reviews;
  List<String> tags;
  List<String> sizes;

  Product(
      {required this.name,
      required this.description,
      required this.ProductID,
      required this.price,
      required this.images,
      required this.cover_image,
      required this.stock,
      required this.rating,
      required this.reviews_count,
      required this.reviews,
      required this.tags,
      required this.sizes});
  static List<Product> products = [
    Product(
        name: "Nike Air Max 270",
        description:
            "The Nike Air Max 270 React combines some of Nike's latest cushioning innovations to create an ultra comfortable and supportive sneaker. They're constructed with a multi-layered no-sew textile upper, feature React cushioning, a 270 Max Air heel unit, rope laces, heel pull tab, and a rubber outsole.",
        ProductID: 1,
        price: 150,
        images: [
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScQDiDA4UQbKKHWP6auYyDbTX6wsL91c4LbQ&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScQDiDA4UQbKKHWP6auYyDbTX6wsL91c4LbQ&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScQDiDA4UQbKKHWP6auYyDbTX6wsL91c4LbQ&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScQDiDA4UQbKKHWP6auYyDbTX6wsL91c4LbQ&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScQDiDA4UQbKKHWP6auYyDbTX6wsL91c4LbQ&usqp=CAU",
        ],
        cover_image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScQDiDA4UQbKKHWP6auYyDbTX6wsL91c4LbQ&usqp=CAU",
        stock: 10,
        rating: 4,
        reviews_count: 10,
        reviews: [
          "Great shoes",
          "Great shoes",
          "Great shoes",
        ],
        tags: [
          "Nike",
          "Air Max",
          "270",
          "React",
          "Black",
          "White",
        ],
        sizes: [
          "7",
          "8",
          "9",
          "10",
          "11",
          "12",
        ]),
    Product(
        name: "Bawarchi T-shirt",
        description: "T-shirt for those with the Bawarchi Badge",
        ProductID: 2,
        price: 100,
        images: [
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQcoTarD1exJRgUImdmZDBN8WOfwHKX6cIoQ&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQcoTarD1exJRgUImdmZDBN8WOfwHKX6cIoQ&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQcoTarD1exJRgUImdmZDBN8WOfwHKX6cIoQ&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQcoTarD1exJRgUImdmZDBN8WOfwHKX6cIoQ&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQcoTarD1exJRgUImdmZDBN8WOfwHKX6cIoQ&usqp=CAU",
        ],
        cover_image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQcoTarD1exJRgUImdmZDBN8WOfwHKX6cIoQ&usqp=CAU",
        stock: 10,
        rating: 4,
        reviews_count: 10,
        reviews: [
          "Great T-shirt",
          "Great T-shirt",
          "Great T-shirt",
        ],
        tags: [
          "T-shirt",
          "Bawarchi",
          "Badge",
        ],
        sizes: [
          "S",
          "M",
          "L",
          "XL",
          "XXL",
        ]),
  ];
}
