import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/details_data_of_planet.dart';
import '../../controllers/favourite_controller.dart';
import '../../modals/planetmodal.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
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
    double h = s.height;
    double w = s.width;

    PlanetModal pm = ModalRoute.of(context)!.settings.arguments as PlanetModal;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://i.pinimg.com/564x/43/87/80/43878074311d7469f695b7b097ede81e.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 56,
                  width: w,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 18,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 250,
                      ),
                      Consumer<FavouriteController>(builder: (context, p, _) {
                        return IconButton(
                            onPressed: () {
                              p.addFavourite(name: pm.name);
                            },
                            icon: Icon(
                              (p.checkStatus(name: pm.name))
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white,
                              size: 30,
                            ));
                      }),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    height: h - 236,
                    width: w - 36,
                    margin: const EdgeInsets.all(18),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff132646).withOpacity(0.8),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        Text(
                          pm.name.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        detailData(pm: pm),
                      ],
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: rotateAnimation,
                  builder: (context, child) {
                    return Positioned(
                      bottom: 480,
                      child: Hero(
                        tag: pm.image,
                        child: Transform.rotate(
                          angle: (pi * rotateAnimation.value),
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(pm.image),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
