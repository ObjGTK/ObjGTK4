/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutAction.h"

/**
 * A `GtkShortcutAction` that calls gtk_widget_mnemonic_activate().
 *
 */
@interface OGTKMnemonicAction : OGTKShortcutAction
{

}

/**
 * Functions
 */

/**
 * Gets the mnemonic action.
 * 
 * This is an action that calls gtk_widget_mnemonic_activate()
 * on the given widget upon activation.
 *
 * @return The mnemonic action
 */
+ (OGTKShortcutAction*)get;

/**
 * Methods
 */

- (GtkMnemonicAction*)castedGObject;

@end