import 'package:flutter/material.dart';
import 'package:verzeo_minor_project/model/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ShopPage();
  }
}

class _ShopPage extends State<ShopPage> {
  // fixed items in the store
  List<Product> productlist = Product.getProducts();
  // this is a growable list for user to add and delete data.
  // basically user's basket
  List<Product> selectedItems = [];
  double totalCost = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(shrinkWrap: true, children: [
      const SizedBox(
        height: 30,
      ),
      const Center(
          child: Text(
        'List of items in store',
        style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold),
      )),
      const SizedBox(height: 10),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productlist.length,
        itemBuilder: ((context, index) {
          var p = productlist[index];
          return ListTile(
            leading: GestureDetector(
              child: const Text(
                '-',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                int flag = 0; //To check whether the chosen product is in basket
                for (int i = 0; i < selectedItems.length; i++) {
                  if (p.name == selectedItems[i].name) {
                    flag = 1; //tells that chosen product is there in the basket
                    int x = selectedItems[i].quantity!;
                    // decrease the total cost
                    totalCost -= p.price;
                    if (x - 1 == 0) {
                      // if quantity of the product = 0, remove it from the basker
                      setState(() {
                        selectedItems.remove(selectedItems[i]);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          displaySnackBar(
                              'Succesfuly deleted product from the Basket', 2));
                    } else {
                      setState(() {
                        selectedItems[i] =
                            selectedItems[i].copy(quantity: x - 1);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(displaySnackBar(
                          'Succesfuly decremented count of product in the Basket',
                          1));
                    }
                    break;
                  }
                }
                if (flag == 0) {
                  //tells that chosen product is not there in the basket
                }
              },
            ),
            title: Text(
              p.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("\u20B9 ${p.price.toString()}",
                style: const TextStyle(color: Colors.pink)),
            trailing: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.green,
              ),
              onPressed: () {
                int flag = 0; //To check whether the chosen product is in basket
                for (int i = 0; i < selectedItems.length; i++) {
                  if (p.name == selectedItems[i].name) {
                    flag = 1; //tells that chosen product is there in the basket
                    // hence update the quantity
                    int x = selectedItems[i].quantity!;
                    setState(() {
                      selectedItems[i] = selectedItems[i].copy(quantity: x + 1);
                      // increase the total cost
                      totalCost += p.price;
                      ScaffoldMessenger.of(context).showSnackBar(displaySnackBar(
                          'Succesfuly incremented product count in the Basket',
                          1));
                    });
                    break;
                  }
                }
                if (flag == 0) {
                  //tells that chosen product is not there in the basket
                  // so add a new product
                  setState(() {
                    selectedItems.add(Product(
                        rating: p.rating,
                        name: p.name,
                        price: p.price,
                        quantity: 1,
                        description: p.description,
                        img: p.img));
                    // increase the total cost
                    totalCost += p.price;
                    ScaffoldMessenger.of(context).showSnackBar(displaySnackBar(
                        'Succesfuly added product to the Basket', 1));
                  });
                }
              },
            ),
          );
        }),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.grey,
          );
        },
      ),
      const SizedBox(
        height: 40,
      ),
      Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Basket ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          ),
          const SizedBox(
            width: 190,
          ),
          Visibility(
            visible: selectedItems.isNotEmpty,
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context1) => AlertDialog(
                            content: const Text(
                                'Do you want to clear your entire basket?'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedItems.clear();
                                      totalCost = 0;
                                      Navigator.pop(context1);
                                    });
                                  },
                                  child: const Text('Yes')),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context1);
                                    });
                                  },
                                  child: const Text('No'))
                            ],
                          ));
                },
                child: const Text('Clear')),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Visibility(
          visible: selectedItems.isEmpty,
          child: const Center(
              child: Text(
            '               Empty! \n Add items to view them',
            style: TextStyle(fontSize: 15),
          ))),
      const SizedBox(
        height: 20,
      ),
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: selectedItems.length,
          itemBuilder: ((context, index) {
            var sp = selectedItems[index];
            return Dismissible(
              key: Key(sp.name),
              onDismissed: ((direction) => setState(() {
                    selectedItems.remove(sp);
                    totalCost -= (sp.price * sp.quantity!);
                    ScaffoldMessenger.of(context).showSnackBar(displaySnackBar(
                        'Succesfuly deleted product from the Basket', 1));
                  })),
              child: ListTile(
                leading: Text(
                  '${index + 1}.',
                  style: const TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
                title: Text(
                  sp.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.purple),
                ),
                //subtitle: Text("Q: ${sp.quantity}\n \u20B9 ${sp.price}"),
                trailing: Text("\u20B9 ${sp.price} \n Q: ${sp.quantity}"),
              ),
            );
          })),
      const SizedBox(
        height: 20,
      ),
      Text(
        'Cost : \u20B9 ${totalCost.toString()} + GST',
        style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
      ),
      const SizedBox(
        height: 30,
      )
    ]));
  }

  displaySnackBar(String txt, int sec) {
    return SnackBar(
      content: Text(txt),
      duration: Duration(seconds: sec),
    );
  }
}
