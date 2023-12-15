// ignore_for_file: prefer_const_constructors

import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:flutter/material.dart';

class AboutMeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(48),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Développeur mobile Android et Flutter Freelance",
                      style: AppTextStyles.textTitle32(color: Colors.black),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "I am a backend developer with expertise in Node.js. I have experience in building scalable, secure and reliable web applications using various frameworks and technologies. I enjoy solving complex problems and learning new skills. I am passionate about creating high-quality code that follows best practices and industry standards. I am always looking for new challenges and opportunities to grow as a developer.",
                      style: AppTextStyles.textLRegular(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 48,
              ),
              Container(
                width: 420.0,
                height: 420.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(MyAssets.profilePhoto),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          Container(
            height: 180,
            child: ListView.separated(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Container(
                    width: 170.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.black.withOpacity(0.7)),
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: const [
                            Image(
                              image: AssetImage(MyAssets.appleLogo),
                              width: 80,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Android",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )));
              }),
              separatorBuilder: (context, index) => SizedBox(width: 48.0),
            ),
          ),
        ],
      ),
    );
  }
}
