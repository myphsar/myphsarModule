import 'package:flutter/material.dart';

Widget loaderView(bool isLoading) => isLoading == true
    ? Container(padding: const EdgeInsets.all(5), child: const CircularProgressIndicator())
    : const SizedBox.shrink();

Widget loaderFullScreenView(BuildContext context, bool isLoading, {Color bgColor = Colors.transparent,}) => isLoading == true
    ? Container(
        height: MediaQuery.of(context).size.height,
        color: bgColor,
        child: Center(
          child: Container(padding: const EdgeInsets.all(5), child: const CircularProgressIndicator()),
        ),
      )
    : const SizedBox.shrink();
