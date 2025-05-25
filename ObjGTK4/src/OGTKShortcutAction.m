/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutAction.h"

#import "OGTKWidget.h"

@implementation OGTKShortcutAction

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUT_ACTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SHORTCUT_ACTION);
	return gObjectClass;
}

+ (instancetype)shortcutActionParseString:(OFString*)string
{
	GtkShortcutAction* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_action_parse_string([string UTF8String]), GTK_TYPE_SHORTCUT_ACTION, GtkShortcutAction);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKShortcutAction* wrapperObject;
	@try {
		wrapperObject = [[OGTKShortcutAction alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkShortcutAction*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SHORTCUT_ACTION, GtkShortcutAction);
}

- (bool)activateWithFlags:(GtkShortcutActionFlags)flags widget:(OGTKWidget*)widget args:(GVariant*)args
{
	bool returnValue = (bool)gtk_shortcut_action_activate((GtkShortcutAction*)[self castedGObject], flags, [widget castedGObject], args);

	return returnValue;
}

- (void)printWithString:(GString*)string
{
	gtk_shortcut_action_print((GtkShortcutAction*)[self castedGObject], string);
}

- (OFString*)toString
{
	char* gobjectValue = gtk_shortcut_action_to_string((GtkShortcutAction*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}


@end