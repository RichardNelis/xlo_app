import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xlo_app/models/ad_model.dart';

class BottomBar extends StatelessWidget {
  final AdModel ad;

  const BottomBar({Key? key, required this.ad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ad.status == AdStatus.pending) {
      return Container();
    }

    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Colors.orange,
            ),
            child: Row(
              children: [
                if (!ad.hidePhone)
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        final phone =
                            "+55${ad.userModel.phone.replaceAll(RegExp('[^0-9]'), '')}";

                        final Uri launchUri = Uri(
                          scheme: 'tel',
                          path: phone,
                        );

                        await launch(launchUri.toString());
                      },
                      child: Container(
                        height: 25,
                        alignment: Alignment.center,
                        child: const Text(
                          "Ligar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 249, 249, 1),
              border: Border(
                top: BorderSide(
                  color: Colors.grey[400]!,
                ),
              ),
            ),
            child: Text(
              "${ad.userModel.name} (anunciante)",
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
