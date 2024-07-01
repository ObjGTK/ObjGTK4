/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGio/OGMountOperation.h>

@class OGTKWindow;
@class OGGdkDisplay;

/**
 * `GtkMountOperation` is an implementation of `GMountOperation`.
 * 
 * The functions and objects described here make working with GTK and
 * GIO more convenient.
 * 
 * `GtkMountOperation` is needed when mounting volumes:
 * It is an implementation of `GMountOperation` that can be used with
 * GIO functions for mounting volumes such as
 * g_file_mount_enclosing_volume(), g_file_mount_mountable(),
 * g_volume_mount(), g_mount_unmount_with_operation() and others.
 * 
 * When necessary, `GtkMountOperation` shows dialogs to let the user
 * enter passwords, ask questions or show processes blocking unmount.
 *
 */
@interface OGTKMountOperation : OGMountOperation
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGTKWindow*)parent;

/**
 * Methods
 */

- (GtkMountOperation*)castedGObject;

/**
 * Gets the display on which windows of the `GtkMountOperation`
 * will be shown.
 *
 * @return the display on which windows of @op are shown
 */
- (OGGdkDisplay*)display;

/**
 * Gets the transient parent used by the `GtkMountOperation`.
 *
 * @return the transient parent for windows shown by @op
 */
- (OGTKWindow*)parent;

/**
 * Returns whether the `GtkMountOperation` is currently displaying
 * a window.
 *
 * @return %TRUE if @op is currently displaying a window
 */
- (bool)isShowing;

/**
 * Sets the display to show windows of the `GtkMountOperation` on.
 *
 * @param display a `GdkDisplay`
 */
- (void)setDisplay:(OGGdkDisplay*)display;

/**
 * Sets the transient parent for windows shown by the
 * `GtkMountOperation`.
 *
 * @param parent transient parent of the window
 */
- (void)setParent:(OGTKWindow*)parent;

@end