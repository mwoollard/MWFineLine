## MWFineLine
With the advent of @2x and @3x iOS device screen resolutions physical pixels are fractional part of logical pixels. UI designs may take advantage of this having fine lines of one pyhsical pixel in width or height. From within Interface Builder using auto-layout there is no way to adjust line widths or heights to fraction of a logical pixel based on the screen pixel size.

Previously I have dealt with this by setting up a constraint to height or width of 1 logical pixel in Interface Builder and binding the constraint to an IBOutlet. Then in code I could obtain the screen display scale factor and adjust the constraint to a fractional size of `1 / displayScale`.

But for a simpler life here is a simple control, **MWFineLine**, that encapsulates this functionality, is fully configurable within Interface Builder and needs no code writing.

The following image shows the demo app running on iPhone 6+ @3x screen, the layout and line widths being achieved completely from within a Storyboard edited in Interface Builder.
## iPhone 6+ screenshot
![
](file:MWFineLineDemo.png)

## Credits
This library has been created by Mark Woollard and has been made available under the **MIT License**. Please see the `LICENSE` file for more information.
