import "package:flutter/material.dart";
import "package:grocery/screen/home_page.dart";

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // logo
            Padding(
              padding: const EdgeInsets.only(right: 80, bottom: 50, top: 20),
              child: Image.asset(
                "assets/images/basket.png",
              ),
            ),
            //some texts
            Text(
              "We delevier Grocery at your doorstep.",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 34,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),

            Text(
                "Consumers health is our moto..\n"
                " Order fresh items from groceries",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey[600],
                    ),
                textAlign: TextAlign.center),
            const Spacer(),
            // started button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const HomepageScreen()),
                );
              },
              icon: const Icon(
                Icons.arrow_forward_sharp,
                color: Colors.white,
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.deepPurpleAccent),
              ),
              label: const Text(
                "Get started",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
