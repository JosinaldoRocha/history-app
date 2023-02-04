import 'package:flutter/material.dart';
import 'package:my_history_app/app/shared/widgets/texts/text_styles.dart';

class BoxText extends StatelessWidget {
  BoxText.body(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = bodyStyle.copyWith(color: color),
        super(key: key);

  BoxText.smallBody(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = smallBodyStyle.copyWith(color: color),
        super(key: key);

  BoxText.smallBodyBoldStyle(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = smallBodyBoldStyle.copyWith(color: color),
        super(key: key);
  BoxText.bodyLight(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = bodyLightStyle.copyWith(color: color),
        super(key: key);

  BoxText.bodyItalic(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = bodyItalicStyle.copyWith(color: color),
        super(key: key);

  final String? text;
  final TextStyle style;
  final TextAlign? textAlign;

  BoxText.bodyBold(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = bodyBoldStyle.copyWith(color: color),
        super(key: key);

  BoxText.largeCaptionBold(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = largeCaptionBoldStyle.copyWith(color: color),
        super(key: key);

  BoxText.headingOne(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = heading1Style.copyWith(color: color),
        super(key: key);
  BoxText.headingTwo(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = heading2Style.copyWith(color: color),
        super(key: key);
  BoxText.headingTwoRegular(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = heading2RegularStyle.copyWith(color: color),
        super(key: key);
  BoxText.headingThree(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = heading3Style.copyWith(color: color),
        super(key: key);
  BoxText.headingThreeRegular(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = heading3RegularStyle.copyWith(color: color),
        super(key: key);
  BoxText.headingFour(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = heading4Style.copyWith(color: color),
        super(key: key);
  BoxText.headingFourRegular(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = heading4RegularStyle.copyWith(color: color),
        super(key: key);
  BoxText.headline(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = headlineStyle.copyWith(color: color),
        super(key: key);
  BoxText.subheading(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = subheadingStyle.copyWith(color: color),
        super(key: key);
  BoxText.caption(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = captionStyle.copyWith(color: color),
        super(key: key);
  BoxText.midCaption(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = midCaptionStyle.copyWith(color: color),
        super(key: key);
  BoxText.underlineCaption(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = underlineCaptionStyle.copyWith(color: color),
        super(key: key);
  BoxText.highlightCaption(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = highlightCaptionStyle.copyWith(color: color),
        super(key: key);

  BoxText.subCaption(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = subcaptionStyle.copyWith(color: color),
        super(key: key);

  BoxText.subCaptionBold(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = subcaptionBoldStyle.copyWith(color: color),
        super(key: key);
  BoxText.captionBold(this.text,
      {Key? key, Color color = Colors.black, this.textAlign})
      : style = captionStyleBold.copyWith(color: color),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: style,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
