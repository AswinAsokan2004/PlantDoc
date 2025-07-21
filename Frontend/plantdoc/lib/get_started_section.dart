import 'package:flutter/material.dart';
import 'package:plantdoc/PredictionSection.dart';

class GetStartedSection extends StatelessWidget {
  const GetStartedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF7A0990),
      child: AspectRatio(
        aspectRatio: 0.462,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              'https://cdn.builder.io/api/v1/image/assets/43a603419f9c47e690eea65da5b5c01e/87ece1a1ba2c843c88b22bb920238b6424bc0c553e828ba53f2f8658dd8ff8fd?apiKey=43a603419f9c47e690eea65da5b5c01e&',
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PlantDoc',
                  style: TextStyle(
                    color: Color.fromARGB(255, 223, 223, 223),
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: 415),
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed logic here
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PredictionSection()));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD5FB00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                    minimumSize: Size(183, 0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
