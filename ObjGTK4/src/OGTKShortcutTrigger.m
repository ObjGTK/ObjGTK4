/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutTrigger.h"

#import <OGdk4/OGdkDisplay.h>

@implementation OGTKShortcutTrigger

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUT_TRIGGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SHORTCUT_TRIGGER);
	return gObjectClass;
}

+ (instancetype)shortcutTriggerParseString:(OFString*)string
{
	GtkShortcutTrigger* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_trigger_parse_string([string UTF8String]), GTK_TYPE_SHORTCUT_TRIGGER, GtkShortcutTrigger);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKShortcutTrigger* wrapperObject;
	@try {
		wrapperObject = [[OGTKShortcutTrigger alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkShortcutTrigger*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SHORTCUT_TRIGGER, GtkShortcutTrigger);
}

- (int)compareWithTrigger2:(gconstpointer)trigger2
{
	int returnValue = (int)gtk_shortcut_trigger_compare((gconstpointer)[self castedGObject], trigger2);

	return returnValue;
}

- (bool)equalWithTrigger2:(gconstpointer)trigger2
{
	bool returnValue = (bool)gtk_shortcut_trigger_equal((gconstpointer)[self castedGObject], trigger2);

	return returnValue;
}

- (guint)hash
{
	guint returnValue = (guint)gtk_shortcut_trigger_hash((gconstpointer)[self castedGObject]);

	return returnValue;
}

- (void)printWithString:(GString*)string
{
	gtk_shortcut_trigger_print((GtkShortcutTrigger*)[self castedGObject], string);
}

- (bool)printLabelWithDisplay:(OGdkDisplay*)display string:(GString*)string
{
	bool returnValue = (bool)gtk_shortcut_trigger_print_label((GtkShortcutTrigger*)[self castedGObject], [display castedGObject], string);

	return returnValue;
}

- (OFString*)toLabelWithDisplay:(OGdkDisplay*)display
{
	char* gobjectValue = gtk_shortcut_trigger_to_label((GtkShortcutTrigger*)[self castedGObject], [display castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)toString
{
	char* gobjectValue = gtk_shortcut_trigger_to_string((GtkShortcutTrigger*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (GdkKeyMatch)triggerWithEvent:(GdkEvent*)event enableMnemonics:(bool)enableMnemonics
{
	GdkKeyMatch returnValue = (GdkKeyMatch)gtk_shortcut_trigger_trigger((GtkShortcutTrigger*)[self castedGObject], event, enableMnemonics);

	return returnValue;
}


@end