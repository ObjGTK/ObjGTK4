/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMnemonicAction.h"

@implementation OGTKMnemonicAction

+ (OGTKShortcutAction*)get
{
	GtkShortcutAction* gobjectValue = GTK_SHORTCUT_ACTION(gtk_mnemonic_action_get());

	OGTKShortcutAction* returnValue = [OGTKShortcutAction withGObject:gobjectValue];
	return returnValue;
}

- (GtkMnemonicAction*)castedGObject
{
	return GTK_MNEMONIC_ACTION([self gObject]);
}


@end