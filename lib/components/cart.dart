import 'package:flutter/foundation.dart';

import '../models/shoe.dart';

class Cart extends ChangeNotifier{
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Air Max',
        price: '255',
        description: 'Better look',
        imagePath: 'lib/Images/nike01.png'
    ),
    Shoe(
        name: 'Air Treys',
        price: '255',
        description: 'Better design for your great look',
        imagePath: 'lib/Images/nike02.png'
    ),
    Shoe(
        name: 'Air Treys',
        price: '255',
        description: 'Better design for your great look',
        imagePath: 'lib/Images/nike03.png'
    ),
    Shoe(
        name: 'Air Max Pro',
        price: '255',
        description: 'A shoe with quality appearance',
        imagePath: 'lib/Images/nike04.png'
    ),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList(){
    return shoeShop;
  }

  List<Shoe> getUserCart(){
    return userCart;
  }

  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}