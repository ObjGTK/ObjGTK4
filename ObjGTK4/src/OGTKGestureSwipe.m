/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSwipe.h"

#import "OGTKGesture.h"

@implementation OGTKGestureSwipe

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_SWIPE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)gestureSwipe
{
	GtkGestureSwipe* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gesture_swipe_new(), GtkGestureSwipe, GtkGestureSwipe);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKGestureSwipe* wrapperObject;
	@try {
		wrapperObject = [[OGTKGestureSwipe alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGestureSwipe*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGestureSwipe, GtkGestureSwipe);
}

- (bool)velocityWithVelocityX:(double*)velocityX velocityY:(double*)velocityY
{
	bool returnValue = (bool)gtk_gesture_swipe_get_velocity([self castedGObject], velocityX, velocityY);

	return returnValue;
}


@end