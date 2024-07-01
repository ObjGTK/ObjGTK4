/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutAction.h"

/**
 * A `GtkShortcutAction` that calls gtk_widget_activate().
 *
 */
@interface OGTKActivateAction : OGTKShortcutAction
{

}

/**
 * Functions
 */

/**
 * Gets the activate action.
 * 
 * This is an action that calls gtk_widget_activate()
 * on the given widget upon activation.
 *
 * @return The activate action
 */
+ (OGTKShortcutAction*)get;

/**
 * Methods
 */

- (GtkActivateAction*)castedGObject;

@end