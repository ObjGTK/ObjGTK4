/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutTrigger.h"

/**
 * A `GtkShortcutTrigger` that combines two triggers.
 * 
 * The `GtkAlternativeTrigger` triggers when either of two trigger.
 * 
 * This can be cascaded to combine more than two triggers.
 *
 */
@interface OGTKAlternativeTrigger : OGTKShortcutTrigger
{

}


/**
 * Constructors
 */
- (instancetype)initWithFirst:(OGTKShortcutTrigger*)first second:(OGTKShortcutTrigger*)second;

/**
 * Methods
 */

- (GtkAlternativeTrigger*)castedGObject;

/**
 * Gets the first of the two alternative triggers that may
 * trigger @self.
 * 
 * [method@Gtk.AlternativeTrigger.get_second] will return
 * the other one.
 *
 * @return the first alternative trigger
 */
- (OGTKShortcutTrigger*)first;

/**
 * Gets the second of the two alternative triggers that may
 * trigger @self.
 * 
 * [method@Gtk.AlternativeTrigger.get_first] will return
 * the other one.
 *
 * @return the second alternative trigger
 */
- (OGTKShortcutTrigger*)second;

@end