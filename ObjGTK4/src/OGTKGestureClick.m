/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureClick.h"

#import "OGTKGesture.h"

@implementation OGTKGestureClick

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_CLICK;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)gestureClick
{
	GtkGestureClick* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gesture_click_new(), GtkGestureClick, GtkGestureClick);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKGestureClick* wrapperObject;
	@try {
		wrapperObject = [[OGTKGestureClick alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGestureClick*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGestureClick, GtkGestureClick);
}


@end