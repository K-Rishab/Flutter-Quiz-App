import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Options extends StatelessWidget {
  //  const Options(this.choice,this.onTap, {super.key});//positional arrguments
  const Options({
    required this.choice,
    required this.onTap,
    super.key,
  }); //Named arrguments
  final String choice;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        backgroundColor: const Color.fromARGB(207, 36, 2, 105),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onTap,
      child: Text(
        choice,
        style: GoogleFonts.alice(
          color: Colors.white,
          fontSize: 17,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
