/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAlternativeTrigger.h"

@implementation OGTKAlternativeTrigger

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ALTERNATIVE_TRIGGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ALTERNATIVE_TRIGGER);
	return gObjectClass;
}

+ (instancetype)alternativeTriggerWithFirst:(OGTKShortcutTrigger*)first second:(OGTKShortcutTrigger*)second
{
	GtkAlternativeTrigger* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_alternative_trigger_new([first castedGObject], [second castedGObject]), GTK_TYPE_ALTERNATIVE_TRIGGER, GtkAlternativeTrigger);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKAlternativeTrigger* wrapperObject;
	@try {
		wrapperObject = [[OGTKAlternativeTrigger alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAlternativeTrigger*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ALTERNATIVE_TRIGGER, GtkAlternativeTrigger);
}

- (OGTKShortcutTrigger*)first
{
	GtkShortcutTrigger* gobjectValue = gtk_alternative_trigger_get_first((GtkAlternativeTrigger*)[self castedGObject]);

	OGTKShortcutTrigger* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKShortcutTrigger*)second
{
	GtkShortcutTrigger* gobjectValue = gtk_alternative_trigger_get_second((GtkAlternativeTrigger*)[self castedGObject]);

	OGTKShortcutTrigger* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end