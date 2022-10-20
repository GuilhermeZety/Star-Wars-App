import 'dart:async';

import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final bool? autoFocus;
  final void Function(String)? onChange, onSubmitted;
  final Function()? order;
  final String? countData;
  final TextInputAction? textInputAction;

  const SearchInput(
      {Key? key,
      required this.controller,
      required this.hint,
      this.onChange,
      this.autoFocus,
      this.countData,
      this.textInputAction,
      this.onSubmitted,
      this.order,})
    : super(key: key);

  @override
  SearchInputState createState() => SearchInputState();
}

class SearchInputState extends State<SearchInput> {
  late Timer timerSearch = Timer(const Duration(days: 30), () {});
  @override
  void initState() {
    super.initState();
    Timer.run(() => load());
  }

  load(){
  }

  // ignore: body_might_complete_normally_nullable
  void Function(String)? search(value) {
    timerSearch.cancel();
    setState(() {
      timerSearch = Timer(const Duration(seconds: 1), () => widget.onChange!(value));
    });
  } 


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                // flex: 10,
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(7),
                  child: TextFormField(
                    autofocus: widget.autoFocus ?? false,
                    textAlign: TextAlign.start,
                    textInputAction: widget.textInputAction,
                    enableInteractiveSelection: true,
                    style: TextStyle(color: Theme.of(context).textTheme.headline1!.color, fontSize: 18),
                    textAlignVertical: TextAlignVertical.center,
                    controller: widget.controller,
                    onChanged: search,
                    onFieldSubmitted: widget.onSubmitted,
                    decoration: InputDecoration(                      
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      hintText: widget.hint ?? "Ex: Cidade, nome do hotel...",
                      hintStyle: TextStyle(color: Theme.of(context).textTheme.headline6!.color ,fontSize: 16),
                      fillColor: Theme.of(context).colorScheme.primaryContainer,
                      border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 5)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(7)
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      suffix: timerSearch.isActive == true ?
                        const SizedBox(height: 20, width: 20,  child: CircularProgressIndicator(strokeWidth: 2,))
                        : const SizedBox(),
                      prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
                      filled: true, isCollapsed: true,
                    ),
                  ),
                ),
              ),
              
            ],
          ),
          const SizedBox(height: 5),
          Visibility(
            visible: widget.countData != null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    '${widget.countData}',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline6!.color,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
