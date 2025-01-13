/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkDrag.h"

#import "OGdkContentProvider.h"
#import "OGdkDevice.h"
#import "OGdkDisplay.h"
#import "OGdkSurface.h"

@implementation OGdkDrag

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_DRAG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGdkDrag*)beginWithSurface:(OGdkSurface*)surface device:(OGdkDevice*)device content:(OGdkContentProvider*)content actions:(GdkDragAction)actions dx:(double)dx dy:(double)dy
{
	GdkDrag* gobjectValue = gdk_drag_begin([surface castedGObject], [device castedGObject], [content castedGObject], actions, dx, dy);

	OGdkDrag* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GdkDrag*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkDrag, GdkDrag);
}

- (void)dropDoneWithSuccess:(bool)success
{
	gdk_drag_drop_done([self castedGObject], success);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = (GdkDragAction)gdk_drag_get_actions([self castedGObject]);

	return returnValue;
}

- (OGdkContentProvider*)content
{
	GdkContentProvider* gobjectValue = gdk_drag_get_content([self castedGObject]);

	OGdkContentProvider* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDevice*)device
{
	GdkDevice* gobjectValue = gdk_drag_get_device([self castedGObject]);

	OGdkDevice* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_drag_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkSurface*)dragSurface
{
	GdkSurface* gobjectValue = gdk_drag_get_drag_surface([self castedGObject]);

	OGdkSurface* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = (GdkContentFormats*)gdk_drag_get_formats([self castedGObject]);

	return returnValue;
}

- (GdkDragAction)selectedAction
{
	GdkDragAction returnValue = (GdkDragAction)gdk_drag_get_selected_action([self castedGObject]);

	return returnValue;
}

- (OGdkSurface*)surface
{
	GdkSurface* gobjectValue = gdk_drag_get_surface([self castedGObject]);

	OGdkSurface* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setHotspotWithHotX:(int)hotX hotY:(int)hotY
{
	gdk_drag_set_hotspot([self castedGObject], hotX, hotY);
}


@end