/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKActivateAction.h"

@implementation OGTKActivateAction

+ (OGTKShortcutAction*)get
{
	GtkShortcutAction* gobjectValue = GTK_SHORTCUT_ACTION(gtk_activate_action_get());

	OGTKShortcutAction* returnValue = [OGTKShortcutAction withGObject:gobjectValue];
	return returnValue;
}

- (GtkActivateAction*)castedGObject
{
	return GTK_ACTIVATE_ACTION([self gObject]);
}


@end