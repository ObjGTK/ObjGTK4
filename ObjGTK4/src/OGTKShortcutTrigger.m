/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutTrigger.h"

#import <OGdk4/OGdkDisplay.h>

@implementation OGTKShortcutTrigger

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUT_TRIGGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithStringParseString:(OFString*)string
{
	GtkShortcutTrigger* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_trigger_parse_string([string UTF8String]), GtkShortcutTrigger, GtkShortcutTrigger);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkShortcutTrigger, GtkShortcutTrigger);
}

- (int)compare:(gconstpointer)trigger2
{
	int returnValue = (int)gtk_shortcut_trigger_compare([self castedGObject], trigger2);

	return returnValue;
}

- (bool)equal:(gconstpointer)trigger2
{
	bool returnValue = (bool)gtk_shortcut_trigger_equal([self castedGObject], trigger2);

	return returnValue;
}

- (guint)hash
{
	guint returnValue = (guint)gtk_shortcut_trigger_hash([self castedGObject]);

	return returnValue;
}

- (void)print:(GString*)string
{
	gtk_shortcut_trigger_print([self castedGObject], string);
}

- (bool)printLabelWithDisplay:(OGdkDisplay*)display string:(GString*)string
{
	bool returnValue = (bool)gtk_shortcut_trigger_print_label([self castedGObject], [display castedGObject], string);

	return returnValue;
}

- (char*)toLabel:(OGdkDisplay*)display
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
	GdkKeyMatch returnValue = (GdkKeyMatch)gtk_shortcut_trigger_trigger([self castedGObject], event, enableMnemonics);

	return returnValue;
}


@end