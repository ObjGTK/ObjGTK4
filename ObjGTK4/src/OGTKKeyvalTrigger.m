/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKKeyvalTrigger.h"

@implementation OGTKKeyvalTrigger

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_KEYVAL_TRIGGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_KEYVAL_TRIGGER);
	return gObjectClass;
}

+ (instancetype)keyvalTriggerWithKeyval:(guint)keyval modifiers:(GdkModifierType)modifiers
{
	GtkKeyvalTrigger* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_keyval_trigger_new(keyval, modifiers), GTK_TYPE_KEYVAL_TRIGGER, GtkKeyvalTrigger);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKKeyvalTrigger* wrapperObject;
	@try {
		wrapperObject = [[OGTKKeyvalTrigger alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkKeyvalTrigger*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_KEYVAL_TRIGGER, GtkKeyvalTrigger);
}

- (guint)keyval
{
	guint returnValue = (guint)gtk_keyval_trigger_get_keyval((GtkKeyvalTrigger*)[self castedGObject]);

	return returnValue;
}

- (GdkModifierType)modifiers
{
	GdkModifierType returnValue = (GdkModifierType)gtk_keyval_trigger_get_modifiers((GtkKeyvalTrigger*)[self castedGObject]);

	return returnValue;
}


@end