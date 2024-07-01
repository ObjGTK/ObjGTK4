/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutAction.h"

/**
 * A `GtkShortcutAction` that does nothing.
 *
 */
@interface OGTKNothingAction : OGTKShortcutAction
{

}

/**
 * Functions
 */

/**
 * Gets the nothing action.
 * 
 * This is an action that does nothing and where
 * activating it always fails.
 *
 * @return The nothing action
 */
+ (OGTKShortcutAction*)get;

/**
 * Methods
 */

- (GtkNothingAction*)castedGObject;

@end