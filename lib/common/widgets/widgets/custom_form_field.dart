import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

/// A reusable form field wrapper for any custom input widget
class KFormField<T> extends FormField<T> {
  KFormField({
    super.key,
    super.initialValue,
    required Widget Function(FormFieldState<T> state) builder,
    super.validator,
    super.onSaved,
    AutovalidateMode? autoValidateMode,
    super.enabled,
  }) : super(
         autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
         builder: (state) {
           final hasError = state.hasError;
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Stack(
                 clipBehavior: Clip.none,
                 children: [
                   /// your actual child (like TextField, Dropdown etc.)
                   builder(state),

                   /// animated overlay border for error
                   AnimatedPositioned(
                     duration: const Duration(milliseconds: 200),
                     top: 0,
                     bottom: 0,
                     left: 0,
                     right: 0,
                     child: IgnorePointer(
                       ignoring: true,
                       child: AnimatedContainer(
                         duration: const Duration(milliseconds: 200),
                         decoration: BoxDecoration(
                           border: Border(
                             bottom: BorderSide(
                               color: hasError ? KColors.error : Colors.transparent,
                               width: hasError ? 1 : 0,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
               if (hasError)
                 Padding(
                   padding: const EdgeInsets.only(top: 4, left: 8),
                   child: Text(
                     state.errorText!,
                     style: const TextStyle().copyWith(
                       fontFamily: "FlameSans",
                       color: KColors.error,
                       fontSize: 14,
                       fontWeight: FontWeight.w600,
                       height: 1.2,
                     ),
                   ),
                 ),
             ],
           );
         },
       );
}
