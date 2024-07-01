/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkBookmarkList` is a list model that wraps `GBookmarkFile`.
 * 
 * It presents a `GListModel` and fills it asynchronously with the
 * `GFileInfo`s returned from that function.
 * 
 * The `GFileInfo`s in the list have some attributes in the recent
 * namespace added: `recent::private` (boolean) and `recent:applications`
 * (stringv).
 *
 */
@interface OGTKBookmarkList : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithFilename:(OFString*)filename attributes:(OFString*)attributes;

/**
 * Methods
 */

- (GtkBookmarkList*)castedGObject;

/**
 * Gets the attributes queried on the children.
 *
 * @return The queried attributes
 */
- (OFString*)attributes;

/**
 * Returns the filename of the bookmark file that
 * this list is loading.
 *
 * @return the filename of the .xbel file
 */
- (OFString*)filename;

/**
 * Gets the IO priority to use while loading file.
 *
 * @return The IO priority.
 */
- (int)ioPriority;

/**
 * Returns %TRUE if the files are currently being loaded.
 * 
 * Files will be added to @self from time to time while loading is
 * going on. The order in which are added is undefined and may change
 * in between runs.
 *
 * @return %TRUE if @self is loading
 */
- (bool)isLoading;

/**
 * Sets the @attributes to be enumerated and starts the enumeration.
 * 
 * If @attributes is %NULL, no attributes will be queried, but a list
 * of `GFileInfo`s will still be created.
 *
 * @param attributes the attributes to enumerate
 */
- (void)setAttributes:(OFString*)attributes;

/**
 * Sets the IO priority to use while loading files.
 * 
 * The default IO priority is %G_PRIORITY_DEFAULT.
 *
 * @param ioPriority IO priority to use
 */
- (void)setIoPriority:(int)ioPriority;

@end