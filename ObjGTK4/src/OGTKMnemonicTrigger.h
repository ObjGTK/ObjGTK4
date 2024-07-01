/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutTrigger.h"

/**
 * A `GtkShortcutTrigger` that triggers when a specific mnemonic is pressed.
 * 
 * Mnemonics require a *mnemonic modifier* (typically <kbd>Alt</kbd>) to be
 * pressed together with the mnemonic key.
 *
 */
@interface OGTKMnemonicTrigger : OGTKShortcutTrigger
{

}


/**
 * Constructors
 */
- (instancetype)init:(guint)keyval;

/**
 * Methods
 */

- (GtkMnemonicTrigger*)castedGObject;

/**
 * Gets the keyval that must be pressed to succeed triggering @self.
 *
 * @return the keyval
 */
- (guint)keyval;

@end