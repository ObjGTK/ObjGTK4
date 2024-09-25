/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkFrame` is a widget that surrounds its child with a decorative
 * frame and an optional label.
 * 
 * ![An example GtkFrame](frame.png)
 * 
 * If present, the label is drawn inside the top edge of the frame.
 * The horizontal position of the label can be controlled with
 * [method@Gtk.Frame.set_label_align].
 * 
 * `GtkFrame` clips its child. You can use this to add rounded corners
 * to widgets, but be aware that it also cuts off shadows.
 * 
 * # GtkFrame as GtkBuildable
 * 
 * The `GtkFrame` implementation of the `GtkBuildable` interface supports
 * placing a child in the label position by specifying “label” as the
 * “type” attribute of a `<child>` element. A normal content child can
 * be specified without specifying a `<child>` type attribute.
 * 
 * An example of a UI definition fragment with GtkFrame:
 * ```xml
 * <object class="GtkFrame">
 *   <child type="label">
 *     <object class="GtkLabel" id="frame_label"/>
 *   </child>
 *   <child>
 *     <object class="GtkEntry" id="frame_content"/>
 *   </child>
 * </object>
 * ```
 * 
 * # CSS nodes
 * 
 * ```
 * frame
 * ├── <label widget>
 * ╰── <child>
 * ```
 * 
 * `GtkFrame` has a main CSS node with name “frame”, which is used to draw the
 * visible border. You can set the appearance of the border using CSS properties
 * like “border-style” on this node.
 * 
 * # Accessibility
 * 
 * `GtkFrame` uses the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 *
 */
@interface OGTKFrame : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)label;

/**
 * Methods
 */

- (GtkFrame*)castedGObject;

/**
 * Gets the child widget of @frame.
 *
 * @return the child widget of @frame
 */
- (OGTKWidget*)child;

/**
 * Returns the frame labels text.
 * 
 * If the frame's label widget is not a `GtkLabel`, %NULL
 * is returned.
 *
 * @return the text in the label, or %NULL if there
 *    was no label widget or the label widget was not a `GtkLabel`.
 *    This string is owned by GTK and must not be modified or freed.
 */
- (OFString*)label;

/**
 * Retrieves the X alignment of the frame’s label.
 *
 * @return the frames X alignment
 */
- (float)labelAlign;

/**
 * Retrieves the label widget for the frame.
 *
 * @return the label widget
 */
- (OGTKWidget*)labelWidget;

/**
 * Sets the child widget of @frame.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Creates a new `GtkLabel` with the @label and sets it as the frame's
 * label widget.
 *
 * @param label the text to use as the label of the frame
 */
- (void)setLabel:(OFString*)label;

/**
 * Sets the X alignment of the frame widget’s label.
 * 
 * The default value for a newly created frame is 0.0.
 *
 * @param xalign The position of the label along the top edge
 *   of the widget. A value of 0.0 represents left alignment;
 *   1.0 represents right alignment.
 */
- (void)setLabelAlign:(float)xalign;

/**
 * Sets the label widget for the frame.
 * 
 * This is the widget that will appear embedded in the top edge
 * of the frame as a title.
 *
 * @param labelWidget the new label widget
 */
- (void)setLabelWidget:(OGTKWidget*)labelWidget;

@end