import 'package:flutter/material.dart';

class ConnectionCardWidget extends StatefulWidget {
  final String userName;
  final String userDescription;
  final Icon userImageIcon;
  final Function onClickHandler;
  final bool? isUserActive;

  const ConnectionCardWidget({
    Key? key,
    required this.userName,
    required this.userDescription,
    required this.userImageIcon,
    required this.onClickHandler,
    this.isUserActive = false,
  }) : super(key: key);

  @override
  State<ConnectionCardWidget> createState() => _ConnectionCardWidgetState();
}

class _ConnectionCardWidgetState extends State<ConnectionCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.blue.shade50,
      onTap: () {
        widget.onClickHandler();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.zero,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 12),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 56,
                      width: 56,
                      decoration: const BoxDecoration(
                        color: Color(0xff7c94b6),
                        borderRadius:
                        BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: widget.userImageIcon,
                    ),
                    const SizedBox(width: 18),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userName,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.87),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            widget.userDescription,
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              letterSpacing: 0.65,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.circle,
                color: !widget.isUserActive! ? Colors.redAccent : Colors.green,
                size: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
