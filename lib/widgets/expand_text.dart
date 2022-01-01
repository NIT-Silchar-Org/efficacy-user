import 'package:flutter/material.dart';

class ExpandText extends StatefulWidget {
  final String text;
  const ExpandText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandTextState createState() => _ExpandTextState();
}

class _ExpandTextState extends State<ExpandText> {
  late bool isclosed;
  @override
  void initState() {
    super.initState();
    isclosed=true;
  }
  @override
  Widget build(BuildContext context) {
    return widget.text.length < 100
        ? Text(widget.text)
        : GestureDetector(
            child: RichText(
              text: TextSpan(
                text: isclosed ? widget.text.substring(0, 95) : widget.text,
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  isclosed
                      ? const TextSpan(
                          text: '...',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        )
                      : const TextSpan(
                          text: '   ',
                        ),
                  isclosed
                      ? const TextSpan(
                          text: 'Read More',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        )
                      : const TextSpan(
                          text: 'Show less',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                isclosed = !isclosed;
              });
            },
          );
  }
}
