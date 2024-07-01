/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkDrag.h"

#import "OGGdkSurface.h"
#import "OGGdkContentProvider.h"
#import "OGGdkDevice.h"
#import "OGGdkDisplay.h"

@implementation OGGdkDrag

+ (OGGdkDrag*)beginWithSurface:(OGGdkSurface*)surface device:(OGGdkDevice*)device content:(OGGdkContentProvider*)content actions:(GdkDragAction)actions dx:(double)dx dy:(double)dy
{
	GdkDrag* gobjectValue = GDK_DRAG(gdk_drag_begin([surface castedGObject], [device castedGObject], [content castedGObject], actions, dx, dy));

	OGGdkDrag* returnValue = [OGGdkDrag withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GdkDrag*)castedGObject
{
	return GDK_DRAG([self gObject]);
}

- (void)dropDone:(bool)success
{
	gdk_drag_drop_done([self castedGObject], success);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = gdk_drag_get_actions([self castedGObject]);

	return returnValue;
}

- (OGGdkContentProvider*)content
{
	GdkContentProvider* gobjectValue = GDK_CONTENT_PROVIDER(gdk_drag_get_content([self castedGObject]));

	OGGdkContentProvider* returnValue = [OGGdkContentProvider withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkDevice*)device
{
	GdkDevice* gobjectValue = GDK_DEVICE(gdk_drag_get_device([self castedGObject]));

	OGGdkDevice* returnValue = [OGGdkDevice withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_drag_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkSurface*)dragSurface
{
	GdkSurface* gobjectValue = GDK_SURFACE(gdk_drag_get_drag_surface([self castedGObject]));

	OGGdkSurface* returnValue = [OGGdkSurface withGObject:gobjectValue];
	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = gdk_drag_get_formats([self castedGObject]);

	return returnValue;
}

- (GdkDragAction)selectedAction
{
	GdkDragAction returnValue = gdk_drag_get_selected_action([self castedGObject]);

	return returnValue;
}

- (OGGdkSurface*)surface
{
	GdkSurface* gobjectValue = GDK_SURFACE(gdk_drag_get_surface([self castedGObject]));

	OGGdkSurface* returnValue = [OGGdkSurface withGObject:gobjectValue];
	return returnValue;
}

- (void)setHotspotWithHotX:(int)hotX hotY:(int)hotY
{
	gdk_drag_set_hotspot([self castedGObject], hotX, hotY);
}


@end