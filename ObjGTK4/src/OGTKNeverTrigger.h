/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutTrigger.h"

/**
 * A `GtkShortcutTrigger` that never triggers.
 *
 */
@interface OGTKNeverTrigger : OGTKShortcutTrigger
{

}

/**
 * Functions
 */

/**
 * Gets the never trigger.
 * 
 * This is a singleton for a trigger that never triggers.
 * Use this trigger instead of %NULL because it implements
 * all virtual functions.
 *
 * @return The never trigger
 */
+ (OGTKShortcutTrigger*)get;

/**
 * Methods
 */

- (GtkNeverTrigger*)castedGObject;

@end