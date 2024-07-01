/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNeverTrigger.h"

@implementation OGTKNeverTrigger

+ (OGTKShortcutTrigger*)get
{
	GtkShortcutTrigger* gobjectValue = GTK_SHORTCUT_TRIGGER(gtk_never_trigger_get());

	OGTKShortcutTrigger* returnValue = [OGTKShortcutTrigger withGObject:gobjectValue];
	return returnValue;
}

- (GtkNeverTrigger*)castedGObject
{
	return GTK_NEVER_TRIGGER([self gObject]);
}


@end