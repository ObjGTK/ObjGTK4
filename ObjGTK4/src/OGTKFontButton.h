/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * The `GtkFontButton` allows to open a font chooser dialog to change
 * the font.
 * 
 * ![An example GtkFontButton](font-button.png)
 * 
 * It is suitable widget for selecting a font in a preference dialog.
 * 
 * # CSS nodes
 * 
 * ```
 * fontbutton
 * ╰── button.font
 *     ╰── [content]
 * ```
 * 
 * `GtkFontButton` has a single CSS node with name fontbutton which
 * contains a button node with the .font style class.
 *
 */
@interface OGTKFontButton : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithFont:(OFString*)fontname;

/**
 * Methods
 */

- (GtkFontButton*)castedGObject;

/**
 * Gets whether the dialog is modal.
 *
 * @return %TRUE if the dialog is modal
 */
- (bool)modal;

/**
 * Retrieves the title of the font chooser dialog.
 *
 * @return an internal copy of the title string
 *   which must not be freed.
 */
- (OFString*)title;

/**
 * Returns whether the selected font is used in the label.
 *
 * @return whether the selected font is used in the label.
 */
- (bool)useFont;

/**
 * Returns whether the selected size is used in the label.
 *
 * @return whether the selected size is used in the label.
 */
- (bool)useSize;

/**
 * Sets whether the dialog should be modal.
 *
 * @param modal %TRUE to make the dialog modal
 */
- (void)setModal:(bool)modal;

/**
 * Sets the title for the font chooser dialog.
 *
 * @param title a string containing the font chooser dialog title
 */
- (void)setTitle:(OFString*)title;

/**
 * If @use_font is %TRUE, the font name will be written
 * using the selected font.
 *
 * @param useFont If %TRUE, font name will be written using font chosen.
 */
- (void)setUseFont:(bool)useFont;

/**
 * If @use_size is %TRUE, the font name will be written using
 * the selected size.
 *
 * @param useSize If %TRUE, font name will be written using the
 *   selected size.
 */
- (void)setUseSize:(bool)useSize;

@end