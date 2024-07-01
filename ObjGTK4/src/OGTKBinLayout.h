/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutManager.h"

/**
 * `GtkBinLayout` is a `GtkLayoutManager` subclass useful for create "bins" of
 * widgets.
 * 
 * `GtkBinLayout` will stack each child of a widget on top of each other,
 * using the [property@Gtk.Widget:hexpand], [property@Gtk.Widget:vexpand],
 * [property@Gtk.Widget:halign], and [property@Gtk.Widget:valign] properties
 * of each child to determine where they should be positioned.
 *
 */
@interface OGTKBinLayout : OGTKLayoutManager
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkBinLayout*)castedGObject;

@end