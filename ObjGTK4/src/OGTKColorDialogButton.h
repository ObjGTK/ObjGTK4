/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKColorDialog;

/**
 * The `GtkColorDialogButton` is a wrapped around a [class@Gtk.ColorDialog]
 * and allows to open a color chooser dialog to change the color.
 * 
 * ![An example GtkColorDialogButton](color-button.png)
 * 
 * It is suitable widget for selecting a color in a preference dialog.
 * 
 * # CSS nodes
 * 
 * ```
 * colorbutton
 * ╰── button.color
 *     ╰── [content]
 * ```
 * 
 * `GtkColorDialogButton` has a single CSS node with name colorbutton which
 * contains a button node. To differentiate it from a plain `GtkButton`,
 * it gets the .color style class.
 *
 */
@interface OGTKColorDialogButton : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGTKColorDialog*)dialog;

/**
 * Methods
 */

- (GtkColorDialogButton*)castedGObject;

/**
 * Returns the `GtkColorDialog` of @self.
 *
 * @return the `GtkColorDialog`
 */
- (OGTKColorDialog*)dialog;

/**
 * Returns the color of the button.
 * 
 * This function is what should be used to obtain
 * the color that was chosen by the user. To get
 * informed about changes, listen to "notify::rgba".
 *
 * @return the color
 */
- (const GdkRGBA*)rgba;

/**
 * Sets a `GtkColorDialog` object to use for
 * creating the color chooser dialog that is
 * presented when the user clicks the button.
 *
 * @param dialog the new `GtkColorDialog`
 */
- (void)setDialog:(OGTKColorDialog*)dialog;

/**
 * Sets the color of the button.
 *
 * @param color the new color
 */
- (void)setRgba:(const GdkRGBA*)color;

@end