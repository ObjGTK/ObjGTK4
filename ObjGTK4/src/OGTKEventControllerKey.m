/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerKey.h"

#import "OGTKIMContext.h"
#import "OGTKWidget.h"

@implementation OGTKEventControllerKey

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EVENT_CONTROLLER_KEY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_EVENT_CONTROLLER_KEY);
	return gObjectClass;
}

+ (instancetype)eventControllerKey
{
	GtkEventControllerKey* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_event_controller_key_new(), GTK_TYPE_EVENT_CONTROLLER_KEY, GtkEventControllerKey);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKEventControllerKey* wrapperObject;
	@try {
		wrapperObject = [[OGTKEventControllerKey alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkEventControllerKey*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_EVENT_CONTROLLER_KEY, GtkEventControllerKey);
}

- (bool)forwardWithWidget:(OGTKWidget*)widget
{
	bool returnValue = (bool)gtk_event_controller_key_forward((GtkEventControllerKey*)[self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (guint)group
{
	guint returnValue = (guint)gtk_event_controller_key_get_group((GtkEventControllerKey*)[self castedGObject]);

	return returnValue;
}

- (OGTKIMContext*)imContext
{
	GtkIMContext* gobjectValue = gtk_event_controller_key_get_im_context((GtkEventControllerKey*)[self castedGObject]);

	OGTKIMContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setImContext:(OGTKIMContext*)imContext
{
	gtk_event_controller_key_set_im_context((GtkEventControllerKey*)[self castedGObject], [imContext castedGObject]);
}


@end