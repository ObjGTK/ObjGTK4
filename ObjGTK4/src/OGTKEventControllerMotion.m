/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerMotion.h"

@implementation OGTKEventControllerMotion

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EVENT_CONTROLLER_MOTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)eventControllerMotion
{
	GtkEventControllerMotion* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_event_controller_motion_new(), GtkEventControllerMotion, GtkEventControllerMotion);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKEventControllerMotion* wrapperObject;
	@try {
		wrapperObject = [[OGTKEventControllerMotion alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkEventControllerMotion*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkEventControllerMotion, GtkEventControllerMotion);
}

- (bool)containsPointer
{
	bool returnValue = (bool)gtk_event_controller_motion_contains_pointer([self castedGObject]);

	return returnValue;
}

- (bool)isPointer
{
	bool returnValue = (bool)gtk_event_controller_motion_is_pointer([self castedGObject]);

	return returnValue;
}


@end