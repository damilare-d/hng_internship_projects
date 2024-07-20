

import 'package:flutter/material.dart';
import 'package:stage_4_hng_app/ui/views/widgets/button_widget.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage("assets/images/emty_wishlist_State.png")),
        SizedBox(height: 8,),
        Text("You do not have any active order", style: TextStyle(
          color: Color(0xff2A2A2A), fontWeight: FontWeight.w500, fontSize: 15, height: 17.58/15
        ),),
        SizedBox(height: 8,),
        ButtonWidget(
          buttonText: "Discover products",
        ),

      ],
    );
  }
}
