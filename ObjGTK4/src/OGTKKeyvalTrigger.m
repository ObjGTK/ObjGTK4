/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKKeyvalTrigger.h"

@implementation OGTKKeyvalTrigger

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_KEYVAL_TRIGGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithKeyval:(guint)keyval modifiers:(GdkModifierType)modifiers
{
	GtkKeyvalTrigger* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_keyval_trigger_new(keyval, modifiers), GtkKeyvalTrigger, GtkKeyvalTrigger);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkKeyvalTrigger, GtkKeyvalTrigger);
}

- (guint)keyval
{
	guint returnValue = (guint)gtk_keyval_trigger_get_keyval([self castedGObject]);

	return returnValue;
}

- (GdkModifierType)modifiers
{
	GdkModifierType returnValue = (GdkModifierType)gtk_keyval_trigger_get_modifiers([self castedGObject]);

	return returnValue;
}


@end