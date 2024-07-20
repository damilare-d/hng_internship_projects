

import 'package:flutter/material.dart';
import 'package:stage_4_hng_app/ui/views/widgets/button_widget.dart';

class EmptyWishlist extends StatelessWidget {
 final void Function()? onTap;
  const EmptyWishlist({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(image: AssetImage("assets/images/emty_wishlist_State.png")),
        const SizedBox(height: 8,),
        const Text("You do not have any active order", style: TextStyle(
          color: Color(0xff2A2A2A), fontWeight: FontWeight.w500, fontSize: 15, height: 17.58/15
        ),),
        const SizedBox(height: 8,),
        ButtonWidget(
          buttonText: "Discover products",
          onTap: onTap ?? (){

          },
        ),

      ],
    );
  }
}
