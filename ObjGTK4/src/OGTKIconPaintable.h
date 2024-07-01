/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * Contains information found when looking up an icon in `GtkIconTheme`.
 * 
 * `GtkIconPaintable` implements `GdkPaintable`.
 *
 */
@interface OGTKIconPaintable : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initForFileWithFile:(GFile*)file size:(int)size scale:(int)scale;

/**
 * Methods
 */

- (GtkIconPaintable*)castedGObject;

/**
 * Gets the `GFile` that was used to load the icon.
 * 
 * Returns %NULL if the icon was not loaded from a file.
 *
 * @return the `GFile` for the icon
 */
- (GFile*)file;

/**
 * Get the icon name being used for this icon.
 * 
 * When an icon looked up in the icon theme was not available, the
 * icon theme may use fallback icons - either those specified to
 * gtk_icon_theme_lookup_icon() or the always-available
 * "image-missing". The icon chosen is returned by this function.
 * 
 * If the icon was created without an icon theme, this function
 * returns %NULL.
 *
 * @return the themed icon-name for the
 *   icon, or %NULL if its not a themed icon.
 */
- (OFString*)iconName;

/**
 * Checks if the icon is symbolic or not.
 * 
 * This currently uses only the file name and not the file contents
 * for determining this. This behaviour may change in the future.
 * 
 * Note that to render a symbolic `GtkIconPaintable` properly (with
 * recoloring), you have to set its icon name on a `GtkImage`.
 *
 * @return %TRUE if the icon is symbolic, %FALSE otherwise
 */
- (bool)isSymbolic;

@end