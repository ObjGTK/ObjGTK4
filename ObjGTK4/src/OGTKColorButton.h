/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * The `GtkColorButton` allows to open a color chooser dialog to change
 * the color.
 * 
 * ![An example GtkColorButton](color-button.png)
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
 * `GtkColorButton` has a single CSS node with name colorbutton which
 * contains a button node. To differentiate it from a plain `GtkButton`,
 * it gets the .color style class.
 *
 */
@interface OGTKColorButton : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithRgba:(const GdkRGBA*)rgba;

/**
 * Methods
 */

- (GtkColorButton*)castedGObject;

/**
 * Gets whether the dialog is modal.
 *
 * @return %TRUE if the dialog is modal
 */
- (bool)modal;

/**
 * Gets the title of the color chooser dialog.
 *
 * @return An internal string, do not free the return value
 */
- (OFString*)title;

/**
 * Sets whether the dialog should be modal.
 *
 * @param modal %TRUE to make the dialog modal
 */
- (void)setModal:(bool)modal;

/**
 * Sets the title for the color chooser dialog.
 *
 * @param title String containing new window title
 */
- (void)setTitle:(OFString*)title;

@end