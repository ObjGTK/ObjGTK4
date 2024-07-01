/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAlternativeTrigger.h"

@implementation OGTKAlternativeTrigger

- (instancetype)initWithFirst:(OGTKShortcutTrigger*)first second:(OGTKShortcutTrigger*)second
{
	GtkAlternativeTrigger* gobjectValue = GTK_ALTERNATIVE_TRIGGER(gtk_alternative_trigger_new([first castedGObject], [second castedGObject]));

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

- (GtkAlternativeTrigger*)castedGObject
{
	return GTK_ALTERNATIVE_TRIGGER([self gObject]);
}

- (OGTKShortcutTrigger*)first
{
	GtkShortcutTrigger* gobjectValue = GTK_SHORTCUT_TRIGGER(gtk_alternative_trigger_get_first([self castedGObject]));

	OGTKShortcutTrigger* returnValue = [OGTKShortcutTrigger withGObject:gobjectValue];
	return returnValue;
}

- (OGTKShortcutTrigger*)second
{
	GtkShortcutTrigger* gobjectValue = GTK_SHORTCUT_TRIGGER(gtk_alternative_trigger_get_second([self castedGObject]));

	OGTKShortcutTrigger* returnValue = [OGTKShortcutTrigger withGObject:gobjectValue];
	return returnValue;
}


@end