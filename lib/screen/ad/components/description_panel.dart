import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:xlo_app/models/ad_model.dart';

class DescriptionPanel extends StatelessWidget {
  final AdModel ad;

  const DescriptionPanel({Key? key, required this.ad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: Text(
            "Descrição",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
          child: ReadMoreText(
            ad.description,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.justify,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: "ver mais",
            trimExpandedText: "ocultar",
            colorClickableText: Colors.purple,
          ),
        )
      ],
    );
  }
}
