/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkDrop.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>
#import "OGdkDevice.h"
#import "OGdkDisplay.h"
#import "OGdkDrag.h"
#import "OGdkSurface.h"

@implementation OGdkDrop

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_DROP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GdkDrop*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkDrop, GdkDrop);
}

- (void)finish:(GdkDragAction)action
{
	gdk_drop_finish([self castedGObject], action);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = (GdkDragAction)gdk_drop_get_actions([self castedGObject]);

	return returnValue;
}

- (OGdkDevice*)device
{
	GdkDevice* gobjectValue = gdk_drop_get_device([self castedGObject]);

	OGdkDevice* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_drop_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDrag*)drag
{
	GdkDrag* gobjectValue = gdk_drop_get_drag([self castedGObject]);

	OGdkDrag* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = (GdkContentFormats*)gdk_drop_get_formats([self castedGObject]);

	return returnValue;
}

- (OGdkSurface*)surface
{
	GdkSurface* gobjectValue = gdk_drop_get_surface([self castedGObject]);

	OGdkSurface* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)readAsyncWithMimeTypes:(const char**)mimeTypes ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_drop_read_async([self castedGObject], mimeTypes, ioPriority, [cancellable castedGObject], callback, userData);
}

- (OGInputStream*)readFinishWithResult:(GAsyncResult*)result outMimeType:(const char**)outMimeType
{
	GError* err = NULL;

	GInputStream* gobjectValue = gdk_drop_read_finish([self castedGObject], result, outMimeType, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGInputStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
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

	const GValue* returnValue = (const GValue*)gdk_drop_read_value_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)statusWithActions:(GdkDragAction)actions preferred:(GdkDragAction)preferred
{
	gdk_drop_status([self castedGObject], actions, preferred);
}


@end