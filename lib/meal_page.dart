import 'package:animated_drawer/models/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> 
{
  final List<Categories> categories = categoriesList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        leading: const MenuDrawer(),
        backgroundColor: Colors.transparent,
        actions:
        [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 20.0,
            width: 80.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
                const Icon(
                  Icons.location_on,
                  size: 15.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Good Evening! David',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const Text(
                'Grab your',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
              const Text(
                'delicious Meal',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              searchFoodWidget(context),
              moreWidget(context, 'Explore Categories'),
              categoriesListViewWidget(context),
              moreWidget(context, 'Most Popular'),
              mostPopularListView(context),
            ],
          ),
        ),
      ),
    );
  }
  Widget mostPopularListView(BuildContext context)
  {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index)
          {
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(
                    bottom: 15,
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children:
                    [
                      Container(
                        height: 100,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('https://previews.123rf.com/images/gbh007/gbh0071408/gbh007140800039/30406006-pepperoni-pizza-on-white-background.jpg'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            const Text(
                              '5 Pepper',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const Text(
                              'Mixed Pizza',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.grey
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                              const [
                                Text(
                                  '\$129',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(
                                  Icons.favorite,
                                  size: 16,
                                  color: Colors.pink,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 25,
                  child: ClipPath(
                    clipper: RatingCurve(),
                    child: Container(
                      padding: const EdgeInsets.only(top: 1),
                      height: 50,
                      width: 25,
                      color: Colors.yellow,
                      child: Column(
                        children:
                        const [
                          Icon(
                            Icons.star_outline,
                            size: 12,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
      ),
    );
  }
  Widget categoriesListViewWidget(BuildContext context)
  {
    return SizedBox(
      height: 130.0,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index)
          {
            final category = categories[index];
            return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 20),
              width: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(90.0),
                  bottom: Radius.circular(90.0),
                ),
                color: Colors.amberAccent[400],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [
                  CircleAvatar(
                    backgroundImage: NetworkImage(category.image),
                    radius: 35,
                  ),
                  Text(
                    category.text,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),

            );
          }
      ),
    );
  }
  Widget moreWidget(BuildContext context, String text)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
      [
        Text(
          text,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: (){},
          child: const Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget searchFoodWidget(BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
      [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
          height: 45.0,
          width: 270.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Colors.white,
          ),
          child:  TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search,),
              hintText: 'Restaurant, Foods...',
              hintStyle: TextStyle(
                color: Colors.grey[200],
                fontSize: 13,
              ),
            ),
          ),
        ),
        Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: Colors.white,
          ),
          child: const Icon(
            Icons.tune,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class RatingCurve extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.lineTo(0.0, height);
    path.quadraticBezierTo(width * 0.5, height - 50, width, height);
    path.lineTo(width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: ()
        {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: const Icon(Icons.menu, color: Colors.black,),
    );
  }
}

