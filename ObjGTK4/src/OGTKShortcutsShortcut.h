/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * A `GtkShortcutsShortcut` represents a single keyboard shortcut or gesture
 * with a short text.
 * 
 * This widget is only meant to be used with `GtkShortcutsWindow`.
 *
 */
@interface OGTKShortcutsShortcut : OGTKWidget
{

}


/**
 * Methods
 */

- (GtkShortcutsShortcut*)castedGObject;

@end