  import 'package:flutter/material.dart';

Container inputCash(BuildContext context, TextEditingController depositMoneyController) {
    return Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: TextField(
                                      controller: depositMoneyController,
                                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.w200),
                                      keyboardType: TextInputType.numberWithOptions(),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        errorText: null,
                                        // helperStyle: 
                                      ),
                                    ),
                                  );
  }