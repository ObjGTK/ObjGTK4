/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutTrigger.h"

#import <OGdk4/OGGdkDisplay.h>

@implementation OGTKShortcutTrigger

- (instancetype)initParseString:(OFString*)string
{
	GtkShortcutTrigger* gobjectValue = GTK_SHORTCUT_TRIGGER(gtk_shortcut_trigger_parse_string([string UTF8String]));

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

- (GtkShortcutTrigger*)castedGObject
{
	return GTK_SHORTCUT_TRIGGER([self gObject]);
}

- (int)compare:(gconstpointer)trigger2
{
	int returnValue = gtk_shortcut_trigger_compare([self castedGObject], trigger2);

	return returnValue;
}

- (bool)equal:(gconstpointer)trigger2
{
	bool returnValue = gtk_shortcut_trigger_equal([self castedGObject], trigger2);

	return returnValue;
}

- (guint)hash
{
	guint returnValue = gtk_shortcut_trigger_hash([self castedGObject]);

	return returnValue;
}

- (void)print:(GString*)string
{
	gtk_shortcut_trigger_print([self castedGObject], string);
}

- (bool)printLabelWithDisplay:(OGGdkDisplay*)display string:(GString*)string
{
	bool returnValue = gtk_shortcut_trigger_print_label([self castedGObject], [display castedGObject], string);

	return returnValue;
}

- (char*)toLabel:(OGGdkDisplay*)display
{
	char* gobjectValue = gtk_shortcut_trigger_to_label([self castedGObject], [display castedGObject]);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (char*)toString
{
	char* gobjectValue = gtk_shortcut_trigger_to_string([self castedGObject]);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (GdkKeyMatch)triggerWithEvent:(GdkEvent*)event enableMnemonics:(bool)enableMnemonics
{
	GdkKeyMatch returnValue = gtk_shortcut_trigger_trigger([self castedGObject], event, enableMnemonics);

	return returnValue;
}


@end