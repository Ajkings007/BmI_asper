import 'constants.dart';
import 'result.dart';
import 'roundbtn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottombtm.dart';
import 'Reusable.dart';
import 'brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPage();
}

class _InputPage extends State<InputPage> {
  Gender selectedgenter = Gender.male;
  int height = 150;
  int weight = 40;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: reuse_card(
                  onpress: () {
                    setState(() {
                      selectedgenter = Gender.male;
                    });
                  },
                  colour: selectedgenter == Gender.male
                      ? activeCardColor
                      : inactiveCardColor,
                  cardchild: iconwithtext(
                    icon: FontAwesomeIcons.mars,
                    text: "Male",
                  ),
                )),
                Expanded(
                    child: reuse_card(
                  onpress: () {
                    setState(() {
                      selectedgenter = Gender.female;
                    });
                  },
                  colour: selectedgenter == Gender.female
                      ? activeCardColor
                      : inactiveCardColor,
                  cardchild: iconwithtext(
                    icon: FontAwesomeIcons.venus,
                    text: "Female",
                  ),
                )),
              ],
            )),
            Expanded(
              child: reuse_card(
                colour: activeCardColor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Heigth",
                      style: lableText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: boldtext,
                        ),
                        const Text(
                          "cm",
                          style: lableText,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          overlayColor: Colors.yellowAccent[50],
                          thumbColor: Colors.yellow[100],
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 11.0),
                          overlayShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 24.0)),
                      child: Slider(
                        activeColor: Colors.yellow,
                        inactiveColor: Colors.yellowAccent[200],
                        value: height.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                        min: 120,
                        max: 220,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: reuse_card(
                    colour: activeCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style: lableText,
                        ),
                        Text(
                          weight.toString(),
                          style: boldtext,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reuse_card(
                    colour: activeCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: lableText,
                        ),
                        Text(
                          age.toString(),
                          style: boldtext,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Bottombtn(
              text: "Calculate BMI",
              ontaop: () {
                brain cal = brain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                              bminum: cal.calculate(),
                              tips: cal.interpertate(),
                              oneword: cal.getresult(),
                            )));
              },
            )
          ],
        ));
  }
}
