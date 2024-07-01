/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKKeyvalTrigger.h"

@implementation OGTKKeyvalTrigger

- (instancetype)initWithKeyval:(guint)keyval modifiers:(GdkModifierType)modifiers
{
	GtkKeyvalTrigger* gobjectValue = GTK_KEYVAL_TRIGGER(gtk_keyval_trigger_new(keyval, modifiers));

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

- (GtkKeyvalTrigger*)castedGObject
{
	return GTK_KEYVAL_TRIGGER([self gObject]);
}

- (guint)keyval
{
	guint returnValue = gtk_keyval_trigger_get_keyval([self castedGObject]);

	return returnValue;
}

- (GdkModifierType)modifiers
{
	GdkModifierType returnValue = gtk_keyval_trigger_get_modifiers([self castedGObject]);

	return returnValue;
}


@end