import 'package:flutter/material.dart';
import 'package:verzeo_minor_project/model/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductDescription();
  }
}

class _ProductDescription extends State<ProductDescription> {
  List<Product> plist = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: plist.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) => ListTile(
                  //leading: Image.network(plist[index].img, width: 20),
                  title: Text(
                    plist[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        plist[index].description,
                        style: const TextStyle(
                            color: Colors.black54, fontStyle: FontStyle.italic),
                      ),
                      RatingBar(
                          itemSize: 30,
                          initialRating: plist[index].rating,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            half: const Icon(
                              Icons.star_half,
                              color: Colors.orange,
                            ),
                            empty: const Icon(
                              Icons.star_border_outlined,
                              color: Colors.orange,
                            ),
                          ),
                          onRatingUpdate: (value) {},
                          allowHalfRating: true),
                    ],
                  ),
                  trailing: Text("\u20B9 ${plist[index].price.toString()}",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                )),
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.orange,
                thickness: 0,
              );
            },
          )
        ],
      ),
    );
  }
}
