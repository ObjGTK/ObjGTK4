/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureDrag.h"

#import "OGTKGesture.h"

@implementation OGTKGestureDrag

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_DRAG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkGestureDrag* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gesture_drag_new(), GtkGestureDrag, GtkGestureDrag);

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

- (GtkGestureDrag*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGestureDrag, GtkGestureDrag);
}

- (bool)offsetWithX:(double*)x y:(double*)y
{
	bool returnValue = (bool)gtk_gesture_drag_get_offset([self castedGObject], x, y);

	return returnValue;
}

- (bool)startPointWithX:(double*)x y:(double*)y
{
	bool returnValue = (bool)gtk_gesture_drag_get_start_point([self castedGObject], x, y);

	return returnValue;
}


@end