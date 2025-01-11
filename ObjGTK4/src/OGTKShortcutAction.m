/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutAction.h"

#import "OGTKWidget.h"

@implementation OGTKShortcutAction

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUT_ACTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)shortcutActionParseString:(OFString*)string
{
	GtkShortcutAction* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_action_parse_string([string UTF8String]), GtkShortcutAction, GtkShortcutAction);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkShortcutAction, GtkShortcutAction);
}

- (bool)activateWithFlags:(GtkShortcutActionFlags)flags widget:(OGTKWidget*)widget args:(GVariant*)args
{
	bool returnValue = (bool)gtk_shortcut_action_activate([self castedGObject], flags, [widget castedGObject], args);

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