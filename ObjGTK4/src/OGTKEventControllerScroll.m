/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerScroll.h"

@implementation OGTKEventControllerScroll

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EVENT_CONTROLLER_SCROLL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)eventControllerScrollWithFlags:(GtkEventControllerScrollFlags)flags
{
	GtkEventControllerScroll* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_event_controller_scroll_new(flags), GtkEventControllerScroll, GtkEventControllerScroll);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKEventControllerScroll* wrapperObject;
	@try {
		wrapperObject = [[OGTKEventControllerScroll alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkEventControllerScroll*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkEventControllerScroll, GtkEventControllerScroll);
}

- (GtkEventControllerScrollFlags)flags
{
	GtkEventControllerScrollFlags returnValue = (GtkEventControllerScrollFlags)gtk_event_controller_scroll_get_flags([self castedGObject]);

	return returnValue;
}

- (GdkScrollUnit)unit
{
	GdkScrollUnit returnValue = (GdkScrollUnit)gtk_event_controller_scroll_get_unit([self castedGObject]);

	return returnValue;
}

- (void)setFlags:(GtkEventControllerScrollFlags)flags
{
	gtk_event_controller_scroll_set_flags([self castedGObject], flags);
}


@end