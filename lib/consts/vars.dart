import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType {
  topTrending,
  allNews,
}

enum SortByEnum {
  relevancy,
  popularity,
  publishedAt,
}

TextStyle smallTextStyle = GoogleFonts.montserrat(fontSize: 15);

const List<String> searchKeywords = [
  "Football",
  "Flutter",
  "Python",
  "Weather",
  "Cryto",
  "Bitcoin",
  "Youtube",
  "Netflix",
  "Meta"
];
