// import 'package:orange_valley_caa/models/Produit.dart';

import '../models/product.dart';

List<Produit> getFakeProducts() {
  return [
    Produit(
        label: "Modeling Faces in Clay with Janet Blake",
        description:
            "This workshop, lead by acclaimed sculptor, and OVCAA resident artist, Janet Blake, is a don't miss experience. Janet shares tips and tricks that have made her one of the foremost artists in modeling faces in clay. Her engaging style will have you clamoring for more.",
        initialPrice:
            5,
        currentPrice: 6),

    Produit(
        label: "Fire Dancers Shine Bright",
        description:
            "Fire Rhythm, a Los Angeles dance team, is rising in the elite ranks of fire dancing. This Produit captured their astounding performance at the Orange Valley Contemporary Arts Museum.",
        initialPrice:
            8,
        currentPrice: 3),

    Produit(
        label: "Graphic Art Camp Draws Youth Artists in Droves",
        description:
            "Ben Woolrich, Principal Designer for Metro Design, has been teaching a Saturday graphic design camp at the Orange Valley Community Center. We filmed his recent session to share his inspiring lessons with the youth art community. Ben's warm and open approach to education, along with his mastery of design, is a joy to behold.",
        initialPrice:
            3,
        currentPrice: 8),

    Produit(
        label: "Plein Air Essentials",
        description:
            "If you've ever wanted to leave the confines of the studio, and paint the world \"en plein air\", as the French say, then this is the course for you. Join Albert Nowak, as he captivates learners with his engaging instruction, as well as his breadth and depth of knowledge of the art of plein air painting.",
        initialPrice:
            6,
        currentPrice: 88),
  ];
}
