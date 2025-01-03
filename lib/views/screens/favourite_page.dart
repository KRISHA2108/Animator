import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/favourite_controller.dart';
import '../../helper/json_helper.dart';
import '../../modals/planetmodal.dart';
import '../../utils/MyRoutes.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation rotateAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
      animationBehavior: AnimationBehavior.preserve,
    );

    rotateAnimation = Tween(begin: 0, end: 1.99).animate(
      animationController,
    );
    animationController.forward();
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Favourite",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
              future: JsonHelper.jsonHelper.getPlanetData(),
              builder: (context, snapshot) {
                return (snapshot.hasData)
                    ? Consumer<FavouriteController>(
                        builder: (context, p, _) {
                          List<PlanetModal> pm = snapshot.data!;
                          List<PlanetModal> allFavouritePlanet = [];
                          pm.forEach((element) {
                            if (p.getAllFavourite.contains(element.name)) {
                              allFavouritePlanet.add(element);
                            }
                          });
                          return (allFavouritePlanet.isNotEmpty)
                              ? GridView.builder(
                                  itemCount: p.getAllFavourite.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2 / 2.5,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            MyRoutes.detail_page,
                                            arguments:
                                                allFavouritePlanet[index]);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xff132646)
                                              .withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Column(
                                          children: [
                                            AnimatedBuilder(
                                              animation: rotateAnimation,
                                              builder: (context, child) {
                                                return Hero(
                                                  tag: allFavouritePlanet[index]
                                                      .image,
                                                  child: Transform.rotate(
                                                    angle: (pi *
                                                        rotateAnimation.value),
                                                    child: Image(
                                                      image: AssetImage(
                                                          allFavouritePlanet[
                                                                  index]
                                                              .image),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            Text(
                                              allFavouritePlanet[index].name,
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text(
                                    "No data Found!!...",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                        },
                      )
                    : const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
