class ResponsiveHelper{
  static double cardWidth(double screenWidth){
    if(screenWidth < 600) {return screenWidth * 0.95;} //MOBILE
    else if (screenWidth < 1000) {return screenWidth * 0.85;} //TABLET
    else {return screenWidth * 0.70 > 1200 ? 1200 : screenWidth * 0.70;} //DESKTOP FINO A 1200 PX
  }
}

/* ESEMPIO:
  SE SCHERMO 1920 px:
   -->70% = 1344px
   -->limitato a 1200 px per perfetta proporzione
 */