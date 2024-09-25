/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkDrop.h"

#import "OGGdkDrag.h"
#import <OGio/OGCancellable.h>
#import "OGGdkDevice.h"
#import <OGio/OGInputStream.h>
#import "OGGdkDisplay.h"
#import "OGGdkSurface.h"

@implementation OGGdkDrop

- (GdkDrop*)castedGObject
{
	return GDK_DROP([self gObject]);
}

- (void)finish:(GdkDragAction)action
{
	gdk_drop_finish([self castedGObject], action);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = gdk_drop_get_actions([self castedGObject]);

	return returnValue;
}

- (OGGdkDevice*)device
{
	GdkDevice* gobjectValue = GDK_DEVICE(gdk_drop_get_device([self castedGObject]));

	OGGdkDevice* returnValue = [OGGdkDevice withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_drop_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkDrag*)drag
{
	GdkDrag* gobjectValue = GDK_DRAG(gdk_drop_get_drag([self castedGObject]));

	OGGdkDrag* returnValue = [OGGdkDrag withGObject:gobjectValue];
	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = gdk_drop_get_formats([self castedGObject]);

	return returnValue;
}

- (OGGdkSurface*)surface
{
	GdkSurface* gobjectValue = GDK_SURFACE(gdk_drop_get_surface([self castedGObject]));

	OGGdkSurface* returnValue = [OGGdkSurface withGObject:gobjectValue];
	return returnValue;
}

- (void)readAsyncWithMimeTypes:(const char**)mimeTypes ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_drop_read_async([self castedGObject], mimeTypes, ioPriority, [cancellable castedGObject], callback, userData);
}

- (OGInputStream*)readFinishWithResult:(GAsyncResult*)result outMimeType:(const char**)outMimeType
{
	GError* err = NULL;

	GInputStream* gobjectValue = G_INPUT_STREAM(gdk_drop_read_finish([self castedGObject], result, outMimeType, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGInputStream* returnValue = [OGInputStream withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)readValueAsyncWithType:(GType)type ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_drop_read_value_async([self castedGObject], type, ioPriority, [cancellable castedGObject], callback, userData);
}

- (const GValue*)readValueFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	const GValue* returnValue = gdk_drop_read_value_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)statusWithActions:(GdkDragAction)actions preferred:(GdkDragAction)preferred
{
	gdk_drop_status([self castedGObject], actions, preferred);
}


@end