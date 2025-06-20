/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutAction.h"

/**
 * A `GtkShortcutAction` that activates an action by name.
 *
 */
@interface OGTKNamedAction : OGTKShortcutAction
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Constructors
 */
+ (instancetype)namedActionWithName:(OFString*)name;

/**
 * Methods
 */

- (GtkNamedAction*)castedGObject;

/**
 * Returns the name of the action that will be activated.
 *
 * @return the name of the action to activate
 */
- (OFString*)actionName;

@end