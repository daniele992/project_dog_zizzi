import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropDownFormFieldDog<T> extends ConsumerWidget{
  final StateProvider<T?> selectedProvider;
  final AsyncValue<List<T>> asyncProvider;
  final String labelText;
  final String hintText;
  final String? Function(T?)? validator;
  final String Function(T) getItemLabel;

  const DropDownFormFieldDog({
    super.key,
    required this.selectedProvider,
    required this.asyncProvider,
    required this.labelText,
    required this.hintText,
    this.validator,
    required this.getItemLabel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final selectedValue = ref.watch(selectedProvider);

    return asyncProvider.when(
        loading: () => const CircularProgressIndicator(),
        error: (e,_) => Text("Errore: $e"),
        data: (items){
          return DropdownButtonFormField<T>(
            isExpanded: true,
            decoration: InputDecoration(labelText: labelText ?? ''),
            initialValue: selectedValue,
            hint: Text(hintText ?? ''),
            onChanged: (val){
              ref.read(selectedProvider.notifier).state = val;
            },
            items: items.map((item) {
              final label = getItemLabel(item) ?? '';
              return DropdownMenuItem<T>(
                value: item,
                child: Text(label),
              );
            }).toList(),
            validator: validator,
          );
        }
    );
  }

}//ConsumerWidget