import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/ui/views/widgets/button_widget.dart';

import 'success_viewmodel.dart';

class SuccessView extends StackedView<SuccessViewModel> {
  const SuccessView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SuccessViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 56),
              const SizedBox(height: 16.0),
              Text(
                'Payment Successful!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
             const Text("You have successfully placed an order. Details of your order has been sent to your email.",
             textAlign: TextAlign.center,
             ),
              const SizedBox(height: 16.0),
              ButtonWidget(
                buttonText: "Okay",
                onTap:  viewModel.onTapOk,
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  SuccessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SuccessViewModel();
}
