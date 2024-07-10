/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerKey.h"

#import "OGTKIMContext.h"
#import "OGTKWidget.h"

@implementation OGTKEventControllerKey

- (instancetype)init
{
	GtkEventControllerKey* gobjectValue = GTK_EVENT_CONTROLLER_KEY(gtk_event_controller_key_new());

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
	return GTK_EVENT_CONTROLLER_KEY([self gObject]);
}

- (bool)forward:(OGTKWidget*)widget
{
	bool returnValue = gtk_event_controller_key_forward([self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (guint)group
{
	guint returnValue = gtk_event_controller_key_get_group([self castedGObject]);

	return returnValue;
}

- (OGTKIMContext*)imContext
{
	GtkIMContext* gobjectValue = GTK_IM_CONTEXT(gtk_event_controller_key_get_im_context([self castedGObject]));

	OGTKIMContext* returnValue = [OGTKIMContext withGObject:gobjectValue];
	return returnValue;
}

- (void)setImContext:(OGTKIMContext*)imContext
{
	gtk_event_controller_key_set_im_context([self castedGObject], [imContext castedGObject]);
}


@end