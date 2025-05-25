/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerFocus.h"

@implementation OGTKEventControllerFocus

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EVENT_CONTROLLER_FOCUS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_EVENT_CONTROLLER_FOCUS);
	return gObjectClass;
}

+ (instancetype)eventControllerFocus
{
	GtkEventControllerFocus* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_event_controller_focus_new(), GTK_TYPE_EVENT_CONTROLLER_FOCUS, GtkEventControllerFocus);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKEventControllerFocus* wrapperObject;
	@try {
		wrapperObject = [[OGTKEventControllerFocus alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkEventControllerFocus*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_EVENT_CONTROLLER_FOCUS, GtkEventControllerFocus);
}

- (bool)containsFocus
{
	bool returnValue = (bool)gtk_event_controller_focus_contains_focus((GtkEventControllerFocus*)[self castedGObject]);

	return returnValue;
}

- (bool)isFocus
{
	bool returnValue = (bool)gtk_event_controller_focus_is_focus((GtkEventControllerFocus*)[self castedGObject]);

	return returnValue;
}


@end