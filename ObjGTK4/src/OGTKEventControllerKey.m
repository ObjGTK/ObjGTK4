/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerKey.h"

#import "OGTKIMContext.h"
#import "OGTKWidget.h"

@implementation OGTKEventControllerKey

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EVENT_CONTROLLER_KEY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkEventControllerKey* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_event_controller_key_new(), GtkEventControllerKey, GtkEventControllerKey);

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

- (GtkEventControllerKey*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkEventControllerKey, GtkEventControllerKey);
}

- (bool)forward:(OGTKWidget*)widget
{
	bool returnValue = (bool)gtk_event_controller_key_forward([self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (guint)group
{
	guint returnValue = (guint)gtk_event_controller_key_get_group([self castedGObject]);

	return returnValue;
}

- (OGTKIMContext*)imContext
{
	GtkIMContext* gobjectValue = gtk_event_controller_key_get_im_context([self castedGObject]);

	OGTKIMContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setImContext:(OGTKIMContext*)imContext
{
	gtk_event_controller_key_set_im_context([self castedGObject], [imContext castedGObject]);
}


@end