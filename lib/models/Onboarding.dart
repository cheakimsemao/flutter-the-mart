class Onboarding {
  int id;
  String text;
  String image;

  Onboarding({
    this.id,
    this.text,
    this.image,
  });

  factory Onboarding.fromJson(Map<String, dynamic> json) => Onboarding(
    id: json['id'],
    text: json['text'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "image": image,
  };
}
