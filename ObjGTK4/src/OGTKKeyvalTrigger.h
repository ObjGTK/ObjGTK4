/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutTrigger.h"

/**
 * A `GtkShortcutTrigger` that triggers when a specific keyval and modifiers are pressed.
 *
 */
@interface OGTKKeyvalTrigger : OGTKShortcutTrigger
{

}


/**
 * Constructors
 */
- (instancetype)initWithKeyval:(guint)keyval modifiers:(GdkModifierType)modifiers;

/**
 * Methods
 */

- (GtkKeyvalTrigger*)castedGObject;

/**
 * Gets the keyval that must be pressed to succeed
 * triggering @self.
 *
 * @return the keyval
 */
- (guint)keyval;

/**
 * Gets the modifiers that must be present to succeed
 * triggering @self.
 *
 * @return the modifiers
 */
- (GdkModifierType)modifiers;

@end