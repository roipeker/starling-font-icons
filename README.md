# starling-font-icons
Font Icons collection for Starling.

Usage is very simple, as it relies on Starling TextField:
```
var icoMenu:FontIcon = new FontIcon(IcoFeather.menu, 24);
icoMenu.color = 0x0;
icoMenu.size = 40 ;
icoMenu.x = 50;
icoMenu.y = 100;
addChild(icoMenu);
```

Compared to the old SWC version, here the TTF files are better generated.
Correct glyph grid size, baseline 0% (icon has no weird offsets) and adjusted unicode values
to avoid Flash TextField incompatibilities with UTF16 and emojis chars.

The TTF files contains ligatures as well. So you can safely install the fonts in your OS, and use Photoshop, Illustrator, or use it in ur html.

I believe this is the first TrueType font that includes the new styled Material Icons collection (sharp, rounded, outline... ).

-----

You can inspect the glyphs and the char codes in the /explorer/ folder...

As the ttfs are generated in the low unicode ranges, all of them are using valid rendereable utf8 characters.
So, you are able to use a tool like https://github.com/soimy/msdf-bmfont-xml and use a charset input field to generated
Multichannel Signed Distance Icons :)


Included Icon Fonts:

https://feathericons.com/

https://ionicons.com/

https://material.io/tools/icons/

https://docs.microsoft.com/en-us/windows/uwp/design/style/segoe-ui-symbol-font


- Update Nov 21:

Included most Segoe MDL2 Assets icons. It took a lot of work and cleanup for the duplicated glyphs in multiple unicode-ranges, so most ligatures are available.
So, if you ever need to do a UWP app, this is your FontIcon.

NOTE: Remember, as this is a custom font version, the ranges are adapted to safer unicode tables for ActionScript, so don't expect to use the official unicode values, like &#xe00c;, instead you should use the glyph name from the official doc. Open explorer/roi-segmdl2/demo.html to check the mapped unicode values.




Enjoy.




  


  
   

