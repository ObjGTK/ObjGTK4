/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutAction.h"

/**
 * A `GtkShortcutAction` that invokes a callback.
 *
 */
@interface OGTKCallbackAction : OGTKShortcutAction
{

}


/**
 * Constructors
 */
- (instancetype)initWithCallback:(GtkShortcutFunc)callback data:(gpointer)data destroy:(GDestroyNotify)destroy;

/**
 * Methods
 */

- (GtkCallbackAction*)castedGObject;

@end