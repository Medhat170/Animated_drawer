import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'models/menu_options.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class MenuOptions
{
  static const home = MenuOption(Icons.home, "Home");
  static const cart = MenuOption(Icons.shopping_cart, "My Cart");
  static const order = MenuOption(Icons.today, "Order History");
  static const promo = MenuOption(Icons.description, "Enter Promo Code");
  static const wallet = MenuOption(Icons.account_balance_wallet, "Wallet");
  static const favorite = MenuOption(Icons.star, "Favorites");
  static const faq = MenuOption(Icons.help, "FAQs");
  static const support = MenuOption(Icons.phone, "Help");
  static const setting = MenuOption(Icons.settings, "Setting");
  static const logout = MenuOption(Icons.logout, "Logout");

  static const allOptions = [
    home,
    cart,
    order,
    promo,
    wallet,
    favorite,
    faq,
    support,
    setting,
    logout,
  ];
}
class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[400],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: InkWell(
              onTap: ()
              {
                ZoomDrawer.of(context)!.close();
              },
              child: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children:
              [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Beckswimbledon.jpg/640px-Beckswimbledon.jpg',),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children:
                  const [
                    Text(
                      'Hello, ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'David',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ...MenuOptions.allOptions.map(optionsList).toList(),
        ],
      ),
    );
  }
   Widget optionsList(MenuOption item)
   {
     return ListTile(
       leading: Icon(
         item.icon,
         color: Colors.black,
       ),
       title: Text(item.title),
       minLeadingWidth: 10,
     );
   }
}
