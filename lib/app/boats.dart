class Boat {
  Boat({
    this.title,
    this.by,
    this.urlImage,
    this.description,
    this.boatLength,
    this.beam,
    this.weight,
    this.fuelCapacity,
  });

  String title;
  String by;
  String urlImage;
  String description;
  String boatLength;
  String beam;
  String weight;
  String fuelCapacity;
}

final boatsData = [
  Boat(
    title: "X22 Lift",
    by: "Mastercraft",
    urlImage: "assets/boat1.png",
    description:
        "Meet the highest-performing inboard waterski boat ever created",
    boatLength: "20' 1.8\"",
    beam: "89\"",
    weight: "2245 KG",
    fuelCapacity: "184 L",
  ),
  Boat(
    title: "X24 Fun",
    by: "Mastercraft",
    urlImage: "assets/boat2.png",
    description:
        "Meet the highest-performing inboard waterski boat ever created",
    boatLength: "22' 2\"",
    beam: "98\"",
    weight: "2680 KG",
    fuelCapacity: "261 L",
  ),
  Boat(
    title: "X24 Force",
    by: "NeoKraft",
    urlImage: "assets/boat3.png",
    description:
        "Meet the highest-performing inboard waterski boat ever created",
    boatLength: "24' 2\"",
    beam: "102\"",
    weight: "2767 KG",
    fuelCapacity: "322 L",
  ),
  Boat(
    title: "X22 Fun",
    by: "NeoKraft",
    urlImage: "assets/boat4.png",
    description:
        "Meet the highest-performing inboard waterski boat ever created",
    boatLength: "20' 1.8\"",
    beam: "89\"",
    weight: "2245 KG",
    fuelCapacity: "184 L",
  ),
];
