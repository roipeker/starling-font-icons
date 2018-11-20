// =================================================================================================
//
//	Created by Rodrigo Lopez [roipeker™] on 19/04/2018.
//
// =================================================================================================

package com.roipeker.starling.icons {
import starling.core.Starling;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.text.TextFieldAutoSize;
import starling.text.TextFormat;

public class FontIcon extends Sprite {

    public static var defaultColor:uint = 0x333333;
    public static var defaultDebugColor:uint = 0x00ff00;
    public static var defaultDebugAlpha:Number = 0.35;

    protected var _tf:TextField;
    protected var _iconData:IconData;
    protected var _size:uint;

    private var _debugSize:Boolean = false;
    private var _debugQuad:Quad;

    private var _invalidDebug:Boolean = false;
    private var _invalidData:Boolean = false;
    private var _invalidSize:Boolean = false;
    private var _invalidColor:Boolean = false;
    private var _color:uint;

    /**
     * Constructor.
     * @param iconData
     * @param size
     */
    public function FontIcon(iconData:IconData, size:uint = 24) {
        _size = size;
        _iconData = iconData;
        _color = defaultColor;
        addEventListener(Event.ADDED_TO_STAGE, onAdded);
        super();
    }

    private function onAdded(event:Event):void {
        if (!_tf) {
            _tf = new TextField(0, 0, _iconData ? _iconData.char : "", new TextFormat(_iconData ? _iconData.fontFamily : "", _size, _color));
            _tf.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
            _tf.x = -1;
            _tf.y = -1;
            addChild(_tf);
            touchGroup = true;
        }
        // invalidation.
        invalidate();
    }


    private function invalidate():void {
        if (!Starling.juggler.containsDelayedCalls(onInvalidate)) {
            Starling.juggler.delayCall(onInvalidate, 0);
        }
    }

    private function onInvalidate():void {
        if (!_tf) return;
        if (_invalidData) {
            _invalidData = false;
            _tf.format.font = _iconData.fontFamily;
            _tf.text = _iconData ? _iconData.char : "";
        }

        if (_invalidColor) {
            _invalidColor = false;
            _tf.format.color = _color;
        }

        if (_invalidSize) {
            _tf.format.size = _size;
        }

        if (_invalidDebug || (_invalidSize && _debugSize)) {
            _invalidDebug = false;
            if (_debugSize) {
                if (!_debugQuad) {
                    _debugQuad = new Quad(_size, _size, FontIcon.defaultDebugColor);
                } else {
                    _debugQuad.readjustSize(_size, _size);
                }
                _debugQuad.alpha = FontIcon.defaultDebugAlpha;
                addChildAt(_debugQuad, 0);
            } else {
                if (_debugQuad) {
                    removeChild(_debugQuad);
                    _debugQuad.dispose();
                    _debugQuad = null;
                }
            }
        }
        _invalidSize = false;
    }


    override public function dispose():void {
        if (!_tf) _tf.dispose();
        _tf = null;
        _iconData = null;
        super.dispose();
    }


    public function set size(value:Number):void {
        if (_size == value) return;
        _size = value;
        _invalidSize = true;
        invalidate();
    }

    public function get size():Number {
        return _size;
    }

    public function set color(val:uint):void {
        if (_color == val) return;
        _color = val;
        _invalidColor = true;
//        _tf.format.color = val;
    }

    public function get color():uint {
        return _color;
//        return _tf.format.color;
    }


    public function get iconData():IconData {
        return _iconData;
    }

    public function set iconData(value:IconData):void {
        if (_iconData == value) return;
        _iconData = value;
        _invalidData = true;
        invalidate();
    }

    public function get debugSize():Boolean {
        return _debugSize;
    }

    public function set debugSize(value:Boolean):void {
        if (_debugSize == value) return;
        _debugSize = value;
        _invalidDebug = true;
        invalidate();
    }


}
}
