class Recommendation {
  final String? name, source, text;

  Recommendation({this.name, this.source, this.text});
}

// Demo recommendations
final List<Recommendation> demo_recommendations = [
  Recommendation(
    name: "Kolapo Obanewa",
    source: "LinkedIn",
    text: "I have had the pleasure of working with Anwar on two flutter projects and what strikes me the most about his work is his ability to write clean and reusable codes with best practices.",
  ),
  Recommendation(
    name: "Reza Shahbazi",
    source: "LinkedIn",
    text: "Abu is great asset for any organization. It's a true pleasure working with him at TakeIn. His flutter skill is amazing as well as his professionalism.",
  ),
  Recommendation(
    name: "Diadem",
    source: "YouTube",
    text: "I like your way you doing your project and you taught us. After I watch this I like and hit the subscribe button!",
  ),
  Recommendation(
    name: "Roshan Shetty",
    source: "YouTube",
    text: "Very straightforward, professional and also the best flutter videos in the youtube! Thank you very much!",
  ),
];