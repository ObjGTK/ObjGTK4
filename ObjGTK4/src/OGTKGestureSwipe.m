/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSwipe.h"

#import "OGTKGesture.h"

@implementation OGTKGestureSwipe

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_SWIPE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_GESTURE_SWIPE);
	return gObjectClass;
}

+ (instancetype)gestureSwipe
{
	GtkGestureSwipe* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gesture_swipe_new(), GTK_TYPE_GESTURE_SWIPE, GtkGestureSwipe);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_GESTURE_SWIPE, GtkGestureSwipe);
}

- (bool)velocityWithVelocityX:(double*)velocityX velocityY:(double*)velocityY
{
	bool returnValue = (bool)gtk_gesture_swipe_get_velocity((GtkGestureSwipe*)[self castedGObject], velocityX, velocityY);

	return returnValue;
}


@end