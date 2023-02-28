class Product {
  final String name;
  final double price;
  final int? quantity;
  final String description;
  final String img;
  final double rating;
  //constructor to create an Object(Product)
  const Product(
      {required this.name,
      required this.price,
      this.quantity,
      required this.description,
      required this.img,
      required this.rating});

  Product copy(
          {String? name,
          double? price,
          int? quantity,
          String? description,
          String? img,
          double? rating}) =>
      Product(
          name: name ?? this.name,
          price: price ?? this.price,
          quantity: quantity ?? this.quantity,
          description: description ?? this.description,
          img: img ?? this.img,
          rating: rating ?? this.rating);

  static List<Product> getProducts() {
    return <Product>[
      const Product(
        rating:2.5,
          name: 'Rice',
          price: 100.12,
          img:
              "https://www.bing.com/images/search?view=detailV2&ccid=yxP%2fmmvH&id=3D30E6F9630788505EE2CE9E903EC15629CF3A4D&thid=OIP.yxP_mmvHMFHTQ-i5MUe2egHaE8&mediaurl=https%3a%2f%2fcdn.tasteatlas.com%2fimages%2fingredients%2f2a47bca8ae89405b97b9b5ae7fe1cdfc.jpg&exph=2000&expw=3000&q=rice&simid=608047256542972815&FORM=IRPRST&ck=217CEFEBFAFFFBCC7A0F55A113810C3C&selectedIndex=6",
          description:
              "rice,edible starchy cereal grain and the grass plant (family Poaceae) by which it is produced. Roughly one-half of the world population, including virtually all of East and Southeast Asia, is wholly dependent upon rice as a staple food; 95 percent of the world’s rice crop is eaten by humans.",),
      const Product(
        rating:3,
          name: 'Milk',
          price: 30,
          img:
              "https://www.bing.com/images/search?view=detailV2&ccid=uHgRSbSo&id=B90F87D294E3FD0CE596A79381B48530972F086F&thid=OIP.uHgRSbSorJxzTxyYydPiIwHaHa&mediaurl=https%3a%2f%2fwww.holistic-wellnessandhealth.com%2fwp-content%2fuploads%2f2020%2f12%2fOat-Milk-Bog-Image.png&exph=1080&expw=1080&q=milk&simid=608006059220469768&FORM=IRPRST&ck=A524A5BCF64F7C7E3039700B94427B16&selectedIndex=18",
          description:
              "Milk is a white liquid food produced by the mammary glands of mammals. It is the primary source of nutrition for young mammals (including breastfed human infants) before they are able to digest solid food. Immune factors and immune-modulating components in milk contribute to milk immunity."),
      const Product(
        rating:1.5,
          name: 'Flour',
          price: 80.75,
          img:
              "https://www.bing.com/images/search?view=detailV2&ccid=FHJf7uPP&id=7D04C842EE32BEF07136FFAD9F6B7231C0300886&thid=OIP.FHJf7uPPZZ9p9Jd_QIhuKgHaFj&mediaurl=https%3a%2f%2fcdn-image.myrecipes.com%2fsites%2fdefault%2ffiles%2fstyles%2fmedium_2x%2fpublic%2f1534456913%2fflour.jpg%3fitok%3d0fgAyJ2q&exph=1500&expw=2000&q=flour&simid=608002155092844485&FORM=IRPRST&ck=DAEB748239225CB39050AC5AD0D3CF6C&selectedIndex=9",
          description:
              "A fine, powdery foodstuff obtained by grinding and sifting the meal of a grain, especially wheat, used chiefly in baking."),
      const Product(
        rating:5,
          name: 'Amla',
          price: 90,
          img:
              "https://www.bing.com/images/search?view=detailV2&ccid=2CjHgfnW&id=E0AF9CEBD73DF4A6D1CE65D8E36E8C66EEEF244A&thid=OIP.2CjHgfnWn5WjbIErx7kXDAHaE8&mediaurl=https%3a%2f%2fwww.verywellhealth.com%2fthmb%2fsmCWvC4eBGI1fRyDFO2OX0y-U3c%3d%2f2121x1414%2ffilters%3afill(87E3EF%2c1)%2fGettyImages-509797455-5897e9ad3df78caebc8aa4e6.jpg&exph=1414&expw=2121&q=amla&simid=608032146845889058&FORM=IRPRST&ck=44A0A62C903BBF8BABE21BB3CCE1B69E&selectedIndex=16",
          description:
              "Amla is a fruit and an ayurvedic herb, botanically known as Phyllanthus Emblica (Emblica Officinalis). It belongs to the Phyllanthaceae family. It is native to India. However, its plants are also found in China, South-east Asia, Pakistan, and Sri Lanka. Its fruits are used fresh and dried."),
      const Product(
        rating:4.5,
          name: 'Banana',
          price: 25,
          img:
              "https://www.bing.com/images/search?view=detailV2&ccid=m1j3MlGp&id=A2CCE4E051250273E30A0D545885D6D3681BAC16&thid=OIP.m1j3MlGpy3CcszmOvaKiXgHaGq&mediaurl=https%3a%2f%2fwww.projuice.co.uk%2fapp%2fuploads%2f2020%2f04%2fFrozen-Banana.jpg&exph=1080&expw=1200&q=banana&simid=608049885056292569&FORM=IRPRST&ck=64A29760BCF2CD3050ECA367F51B6C4A&selectedIndex=17",
          description:
              "A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called 'plantains', distinguishing them from dessert bananas."),
      const Product(
          rating:3.5,
          name: 'Almond',
          price: 89.99,
          img:
              "https://www.bing.com/images/search?view=detailV2&ccid=NYC6N1WU&id=E74C956D84B955BD7C1236D2A95CE37C70D15CDA&thid=OIP.NYC6N1WULB72EqeccTTWLQHaE8&mediaurl=https%3a%2f%2ffillyourplate.org%2fblog%2fwp-content%2fuploads%2f2015%2f02%2fbigstock-Almond-in-wooden-bowl-on-wood-48279077.jpg&exph=1067&expw=1600&q=almond&simid=608006183772312006&FORM=IRPRST&ck=7026A13C752172627F62D433BDA45A6C&selectedIndex=2",
          description:
              "The almond is often thought of as a nut, though it's technically a drupe fruit produced by the almond tree ( Prunus dulcis; Prunus amygdalus ). It's native to North Africa, West Asia, and the Mediterranean, though most almonds today are grown in the United States, Spain, and Italy."),
      
    ];
  }
}
