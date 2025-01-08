/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAlternativeTrigger.h"

@implementation OGTKAlternativeTrigger

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ALTERNATIVE_TRIGGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithFirst:(OGTKShortcutTrigger*)first second:(OGTKShortcutTrigger*)second
{
	GtkAlternativeTrigger* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_alternative_trigger_new([first castedGObject], [second castedGObject]), GtkAlternativeTrigger, GtkAlternativeTrigger);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkAlternativeTrigger, GtkAlternativeTrigger);
}

- (OGTKShortcutTrigger*)first
{
	GtkShortcutTrigger* gobjectValue = gtk_alternative_trigger_get_first([self castedGObject]);

	OGTKShortcutTrigger* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKShortcutTrigger*)second
{
	GtkShortcutTrigger* gobjectValue = gtk_alternative_trigger_get_second([self castedGObject]);

	OGTKShortcutTrigger* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end