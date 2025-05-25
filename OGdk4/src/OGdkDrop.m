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

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_DROP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_DROP);
	return gObjectClass;
}

- (GdkDrop*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_DROP, GdkDrop);
}

- (void)finishWithAction:(GdkDragAction)action
{
	gdk_drop_finish((GdkDrop*)[self castedGObject], action);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = (GdkDragAction)gdk_drop_get_actions((GdkDrop*)[self castedGObject]);

	return returnValue;
}

- (OGdkDevice*)device
{
	GdkDevice* gobjectValue = gdk_drop_get_device((GdkDrop*)[self castedGObject]);

	OGdkDevice* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_drop_get_display((GdkDrop*)[self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDrag*)drag
{
	GdkDrag* gobjectValue = gdk_drop_get_drag((GdkDrop*)[self castedGObject]);

	OGdkDrag* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = (GdkContentFormats*)gdk_drop_get_formats((GdkDrop*)[self castedGObject]);

	return returnValue;
}

- (OGdkSurface*)surface
{
	GdkSurface* gobjectValue = gdk_drop_get_surface((GdkDrop*)[self castedGObject]);

	OGdkSurface* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)readAsyncWithMimeTypes:(const char**)mimeTypes ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_drop_read_async((GdkDrop*)[self castedGObject], mimeTypes, ioPriority, [cancellable castedGObject], callback, userData);
}

- (OGInputStream*)readFinishWithResult:(GAsyncResult*)result outMimeType:(const char**)outMimeType
{
	GError* err = NULL;

	GInputStream* gobjectValue = gdk_drop_read_finish((GdkDrop*)[self castedGObject], result, outMimeType, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGInputStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)readValueAsyncWithType:(GType)type ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_drop_read_value_async((GdkDrop*)[self castedGObject], type, ioPriority, [cancellable castedGObject], callback, userData);
}

- (const GValue*)readValueFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	const GValue* returnValue = (const GValue*)gdk_drop_read_value_finish((GdkDrop*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)statusWithActions:(GdkDragAction)actions preferred:(GdkDragAction)preferred
{
	gdk_drop_status((GdkDrop*)[self castedGObject], actions, preferred);
}


@end