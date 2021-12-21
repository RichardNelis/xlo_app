import 'package:flutter/material.dart';
import 'package:xlo_app/models/ad_model.dart';

class LocationPanel extends StatelessWidget {
  final AdModel ad;

  const LocationPanel({Key? key, required this.ad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 18, bottom: 12),
          child: Text(
            "Localização",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("CEP"),
                  SizedBox(height: 12),
                  Text("Município"),
                  SizedBox(height: 12),
                  Text("Bairro")
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ad.address.cep),
                    const SizedBox(height: 12),
                    Text(ad.address.cityModel.name),
                    const SizedBox(height: 12),
                    Text(ad.address.district),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
