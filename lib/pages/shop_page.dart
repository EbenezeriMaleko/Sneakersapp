import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakersapp/components/shoe_tile.dart';
import 'package:sneakersapp/models/shoe.dart';

import '../components/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // add shoe to cart
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
      title: Text('successfully added to cart'),
        content: Text('Check your cart'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder:(context, value, child) => Column(
          children: [
            //search bar
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'search',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            //message

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                'everyone flies.. some fly longer than others',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),

            //hot picks

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Hot picks',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'see all',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //get a shoe from a shoe list
                  Shoe shoe = value.getShoeList()[index];
                  return ShoeTile(
                    shoe: shoe ,
                    onTap: () => addShoeToCart(shoe),
                  );
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Divider(
                color: Colors.white,
              ),
            ),
          ],
        ),
    );
  }
}
