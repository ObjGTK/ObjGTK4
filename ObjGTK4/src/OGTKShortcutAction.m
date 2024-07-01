/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutAction.h"

#import "OGTKWidget.h"

@implementation OGTKShortcutAction

- (instancetype)initParseString:(OFString*)string
{
	GtkShortcutAction* gobjectValue = GTK_SHORTCUT_ACTION(gtk_shortcut_action_parse_string([string UTF8String]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkShortcutAction*)castedGObject
{
	return GTK_SHORTCUT_ACTION([self gObject]);
}

- (bool)activateWithFlags:(GtkShortcutActionFlags)flags widget:(OGTKWidget*)widget args:(GVariant*)args
{
	bool returnValue = gtk_shortcut_action_activate([self castedGObject], flags, [widget castedGObject], args);

	return returnValue;
}

- (void)print:(GString*)string
{
	gtk_shortcut_action_print([self castedGObject], string);
}

- (char*)toString
{
	char* gobjectValue = gtk_shortcut_action_to_string([self castedGObject]);

	char* returnValue = gobjectValue;
	return returnValue;
}


@end