/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWindow;

/**
 * `GtkWindowGroup` makes group of windows behave like separate applications.
 * 
 * It achieves this by limiting the effect of GTK grabs and modality
 * to windows in the same group.
 * 
 * A window can be a member in at most one window group at a time.
 * Windows that have not been explicitly assigned to a group are
 * implicitly treated like windows of the default window group.
 * 
 * `GtkWindowGroup` objects are referenced by each window in the group,
 * so once you have added all windows to a `GtkWindowGroup`, you can drop
 * the initial reference to the window group with g_object_unref(). If the
 * windows in the window group are subsequently destroyed, then they will
 * be removed from the window group and drop their references on the window
 * group; when all window have been removed, the window group will be
 * freed.
 *
 */
@interface OGTKWindowGroup : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkWindowGroup*)castedGObject;

/**
 * Adds a window to a `GtkWindowGroup`.
 *
 * @param window the `GtkWindow` to add
 */
- (void)addWindow:(OGTKWindow*)window;

/**
 * Returns a list of the `GtkWindows` that belong to @window_group.
 *
 * @return A
 *   newly-allocated list of windows inside the group.
 */
- (GList*)listWindows;

/**
 * Removes a window from a `GtkWindowGroup`.
 *
 * @param window the `GtkWindow` to remove
 */
- (void)removeWindow:(OGTKWindow*)window;

@end