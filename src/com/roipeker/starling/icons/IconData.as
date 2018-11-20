// =================================================================================================
//
//	Created by Rodrigo Lopez [roipeker™] on 18/04/2018.
//
// =================================================================================================

package com.roipeker.starling.icons {
public class IconData {

    public var fontFamily:String;
    public var ligature:String;
    public var charCode:uint;

    public function IconData(charCode:uint, fontFamily:String, ligature:String = null) {
        this.charCode = charCode;
        this.ligature = ligature;
        this.fontFamily = fontFamily;
    }

    public function get char():String {
        return String.fromCharCode(charCode);
    }

}
}
