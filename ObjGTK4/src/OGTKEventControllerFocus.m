/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerFocus.h"

@implementation OGTKEventControllerFocus

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EVENT_CONTROLLER_FOCUS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)eventControllerFocus
{
	GtkEventControllerFocus* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_event_controller_focus_new(), GtkEventControllerFocus, GtkEventControllerFocus);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkEventControllerFocus, GtkEventControllerFocus);
}

- (bool)containsFocus
{
	bool returnValue = (bool)gtk_event_controller_focus_contains_focus([self castedGObject]);

	return returnValue;
}

- (bool)isFocus
{
	bool returnValue = (bool)gtk_event_controller_focus_is_focus([self castedGObject]);

	return returnValue;
}


@end