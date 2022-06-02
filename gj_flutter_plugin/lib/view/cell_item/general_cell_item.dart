import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../../config/text_style_ms.dart';
import '../separator.dart';

class GeneralCellItem extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String subtitle;
  final int badge;
  final bool required;

  const GeneralCellItem(
      {Key? key,
      this.onTap,
      this.title = '',
      this.badge = 0,
      this.required = false,
      this.subtitle = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                Visibility(
                  visible: required,
                  child: Row(
                    children: const [
                      Text(
                        "*",
                        style: TextStyleMs.red_mask,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                ),
                Text(title,
                    style: const TextStyle(
                        fontSize: 14, color: Color(0xff666666))),
                Expanded(
                    child: Text(
                  subtitle,
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xff333333)),
                  textAlign: TextAlign.end,
                )),
                Badge(
                  badgeContent: Text(
                    '$badge',
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  showBadge: badge > 0,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black26,
                  size: 15,
                ),
                const SizedBox(
                  width: 12,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Separator()
          ],
        ),
      ),
      onTap: () {
        onTap == null ? "" : onTap!();
      },
    );
  }
}
