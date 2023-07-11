class ImageResize {
  List result = [];
  imageResizeFun(
    double screenwidth,
    double screenheight,
    double description1Height,
    double description2Height,
    double paddingtop,
    double paddingbottom,
    double paddingright,
    double paddingleft,
    double imagewidth,
    double imageheight,
    int col,
  ) {
    double? imageratio;
    double containerWidth = 0;
    double containerPropotion = 0;
    double? imageActualWidth;
    double? actualPadding;
    double? imageActualheight;
    double? containerActualHieght;
    double newimageHt;
    double? containerHeight;
    double cont_actual_h_prop;
    /////////////////////////////
    ///    double cont_actual_h_prop;
    print("screen height : ${screenheight}, screen width : ${screenwidth}");
    containerHeight = imageheight +
        description1Height +
        description2Height +
        paddingtop +
        paddingbottom;
    print("containerHeight : ${containerHeight}");
    containerWidth = imagewidth + paddingleft + paddingright;
    print("containerWidth : ${containerWidth}");

    double colwidth = screenwidth / col;
    print("colwidth : ${colwidth}");

    double colwidth_Wopadd = colwidth - paddingleft - paddingright;
    print("colwidth_Wopadd : ${colwidth_Wopadd}");

    containerPropotion = colwidth_Wopadd / imagewidth;
    print("containerPropotion : ${containerPropotion}");

    imageratio = imageheight / imagewidth;
    print("imageratio : ${imageratio}");

    imageActualWidth = containerPropotion * imagewidth;

    imageActualheight = imageActualWidth * imageratio;
    print(
        "imageActualWidth : ${imageActualWidth},imageActualheight : ${imageActualheight}");

    double containerAcWidth = imageActualWidth + paddingleft + paddingright;
    print("containerAcWidth : ${containerAcWidth}");

    containerActualHieght = imageActualheight +
        description1Height +
        description2Height +
        paddingbottom +
        paddingtop;
    print("containerActualHieght : ${containerActualHieght}");
    if (containerActualHieght > screenheight) {
      imageheight = screenheight -
          description1Height -
          description2Height -
          paddingbottom -
          paddingtop;
      print("newimageHt : ${imageheight}");
      imagewidth = imageheight / imageratio;
      print("imagewidth : ${imagewidth}");

      containerActualHieght = imageheight +
          description1Height +
          description2Height +
          paddingbottom +
          paddingtop;
      print("containerActualHieght : ${containerActualHieght}");
      cont_actual_h_prop =
          // 1 - ((screenheight / (2/col))/ containerActualHieght);
          1 - (screenheight / 4 / containerActualHieght);
      print("cont_actual_h_prop if: ${cont_actual_h_prop}");
    } else {
      cont_actual_h_prop = (screenheight / (col * 2) / containerActualHieght);
      print("cont_actual_h_prop els: ${cont_actual_h_prop}");
    }
    return [
      containerActualHieght,
      imageActualWidth,
      imageActualheight,
      cont_actual_h_prop,
    ];
  }
}
