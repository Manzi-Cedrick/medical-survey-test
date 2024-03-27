import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ActionDoAble extends StatefulWidget {
  const ActionDoAble({Key? key}) : super(key: key);

  @override
  _ActionDoAbleState createState() => _ActionDoAbleState();
}

class _ActionDoAbleState extends State<ActionDoAble> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: TSpacingStyle.paddingWithAppBarHeight,
      child: Column(
        children: [
          const Text(
              'You have always dreamded of pursuing a career in music. You have a passion for music and you are a talented musician. You have been playing the guitar for years and you have written many songs. You have always wanted to share your music with the world. You have been working on an album for the past year and you are finally ready to release it. You have been performing at local venues and you have built a small following. You have been getting positive feedback from your fans and you are excited to take your music to the next level. You have been offered a record deal by a major record label. This is a dream come true for you. You have always wanted to be a professional musician and now you have the opportunity to make it happen. You are thrilled to have the chance to share your music with a larger audience and to have the support of a record label to help you achieve your goals. You are excited to sign the contract and start working on your album. You are confident that this is the right decision for you and you are ready to take the next step in your music career. What would you do to nurture your passion for music?'),
          const SizedBox(height: TSizes.spaceBtwItems),
          const TextField(
            decoration: InputDecoration(hintText: 'Type your answer here'),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Container(
            padding: const EdgeInsets.all(TSizes.lg),
            decoration: BoxDecoration(
              color: Colors.green.shade300,
              border: Border.all(color: Colors.green.shade200),
              borderRadius: BorderRadius.circular(TSizes.sm),
            ),
            child: const Text(
                'Delve into your desire and passions. Explore ways to incorporate music into your daily life. Take time to practice and improve your skills. Seek out opportunities to perform and share your music with others. Connect with other musicians and collaborate on projects. Set goals and work towards achieving them. Stay motivated and focused on your music career. Be open to new opportunities and experiences. Stay true to yourself and your music. Follow your heart and pursue your dreams. How do you obtain your passion for music?'),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          const TextField(
            decoration: InputDecoration(hintText: 'Type your answer here'),
          ),
        ],
      ),
    );
  }
}
