import 'package:flutter/material.dart';
import '../modals/planetmodal.dart';

Widget detailData({required PlanetModal pm}) {
  return Expanded(
    child: Container(
      height: 374,
      padding: const EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //distance
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'DISTANCE FROM EARTH : \t',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${pm.distancefromEarth} KM',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            //velocity
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'VELOCITY \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${pm.velocity} ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const Spacer(),
              ],
            ),

            //size
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SIZE\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${pm.size} ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const Spacer(),
              ],
            ),

            // satelatite
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SATELLITE\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${pm.satellites} ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const Spacer(),
              ],
            ),

            //temprature
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'TEMPERETURE\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${pm.temperature} ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const Spacer(),
              ],
            ),

            //orbitalspeed
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ORBITALSPEED\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${pm.orbitalSpeed} ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const Spacer(),
              ],
            ),

            //surface area
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'SURFACEAREA \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    pm.surfaceArea.padLeft(11, '0'),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            //orbitalspeed
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ROTATION PERIOD\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${pm.rotationPeriod} ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            //Discription
            const Text(
              "DISCRIPTION",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${pm.description} ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
