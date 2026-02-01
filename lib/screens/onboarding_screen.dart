import 'package:cake_app/screens/login_screen.dart';
import 'package:cake_app/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  int currentIndex = 0;

  List<Widget> pages = [
    OnboardPage(
      title: "Delicious Cakes",
      subtitle: "Discover a world of fresh, handmade cakes crafted with love.",
      image:
          "https://images.arla.com/recordid/800751B7-5FFD-4169-800510DAA9989927/picture.jpg",
    ),

    OnboardPage(
      title: "Order in Minutes",
      subtitle: "Choose your favorite cake and get it delivered right away.",
      image:"https://sugarandsparrow.s3.us-west-2.amazonaws.com/flour/wp-content/uploads/2022/02/16214527/Best-Vanilla-Cake-Recipe-6.jpeg"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) => pages[index],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: currentIndex == index ? 25 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? const Color(0xFFFF6A7A)
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentIndex == pages.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6A7A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    currentIndex == pages.length - 1 ? "Start" : "Next",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const OnboardPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(image: image, title: title, subtitle: subtitle);
  }
}


