/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcut.h"

#import "OGTKShortcutAction.h"
#import "OGTKShortcutTrigger.h"

@implementation OGTKShortcut

- (instancetype)initWithTrigger:(OGTKShortcutTrigger*)trigger action:(OGTKShortcutAction*)action
{
	GtkShortcut* gobjectValue = GTK_SHORTCUT(gtk_shortcut_new([trigger castedGObject], [action castedGObject]));

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

- (GtkShortcut*)castedGObject
{
	return GTK_SHORTCUT([self gObject]);
}

- (OGTKShortcutAction*)action
{
	GtkShortcutAction* gobjectValue = GTK_SHORTCUT_ACTION(gtk_shortcut_get_action([self castedGObject]));

	OGTKShortcutAction* returnValue = [OGTKShortcutAction withGObject:gobjectValue];
	return returnValue;
}

- (GVariant*)arguments
{
	GVariant* returnValue = gtk_shortcut_get_arguments([self castedGObject]);

	return returnValue;
}

- (OGTKShortcutTrigger*)trigger
{
	GtkShortcutTrigger* gobjectValue = GTK_SHORTCUT_TRIGGER(gtk_shortcut_get_trigger([self castedGObject]));

	OGTKShortcutTrigger* returnValue = [OGTKShortcutTrigger withGObject:gobjectValue];
	return returnValue;
}

- (void)setAction:(OGTKShortcutAction*)action
{
	gtk_shortcut_set_action([self castedGObject], [action castedGObject]);
}

- (void)setArguments:(GVariant*)args
{
	gtk_shortcut_set_arguments([self castedGObject], args);
}

- (void)setTrigger:(OGTKShortcutTrigger*)trigger
{
	gtk_shortcut_set_trigger([self castedGObject], [trigger castedGObject]);
}


@end