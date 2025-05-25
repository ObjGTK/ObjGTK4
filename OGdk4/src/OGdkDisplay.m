/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkDisplay.h"

#import "OGdkAppLaunchContext.h"
#import "OGdkClipboard.h"
#import "OGdkDevice.h"
#import "OGdkGLContext.h"
#import "OGdkMonitor.h"
#import "OGdkSeat.h"
#import "OGdkSurface.h"

@implementation OGdkDisplay

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_DISPLAY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_DISPLAY);
	return gObjectClass;
}

+ (OGdkDisplay*)default
{
	GdkDisplay* gobjectValue = gdk_display_get_default();

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

+ (OGdkDisplay*)openWithDisplayName:(OFString*)displayName
{
	GdkDisplay* gobjectValue = gdk_display_open([displayName UTF8String]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkDisplay*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_DISPLAY, GdkDisplay);
}

- (void)beep
{
	gdk_display_beep((GdkDisplay*)[self castedGObject]);
}

- (void)close
{
	gdk_display_close((GdkDisplay*)[self castedGObject]);
}

- (OGdkGLContext*)createGlContext
{
	GError* err = NULL;

	GdkGLContext* gobjectValue = gdk_display_create_gl_context((GdkDisplay*)[self castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkGLContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)deviceIsGrabbedWithDevice:(OGdkDevice*)device
{
	bool returnValue = (bool)gdk_display_device_is_grabbed((GdkDisplay*)[self castedGObject], [device castedGObject]);

	return returnValue;
}

- (void)flush
{
	gdk_display_flush((GdkDisplay*)[self castedGObject]);
}

- (OGdkAppLaunchContext*)appLaunchContext
{
	GdkAppLaunchContext* gobjectValue = gdk_display_get_app_launch_context((GdkDisplay*)[self castedGObject]);

	OGdkAppLaunchContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGdkClipboard*)clipboard
{
	GdkClipboard* gobjectValue = gdk_display_get_clipboard((GdkDisplay*)[self castedGObject]);

	OGdkClipboard* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkSeat*)defaultSeat
{
	GdkSeat* gobjectValue = gdk_display_get_default_seat((GdkDisplay*)[self castedGObject]);

	OGdkSeat* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkDmabufFormats*)dmabufFormats
{
	GdkDmabufFormats* returnValue = (GdkDmabufFormats*)gdk_display_get_dmabuf_formats((GdkDisplay*)[self castedGObject]);

	return returnValue;
}

- (OGdkMonitor*)monitorAtSurface:(OGdkSurface*)surface
{
	GdkMonitor* gobjectValue = gdk_display_get_monitor_at_surface((GdkDisplay*)[self castedGObject], [surface castedGObject]);

	OGdkMonitor* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GListModel*)monitors
{
	GListModel* returnValue = (GListModel*)gdk_display_get_monitors((GdkDisplay*)[self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gdk_display_get_name((GdkDisplay*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGdkClipboard*)primaryClipboard
{
	GdkClipboard* gobjectValue = gdk_display_get_primary_clipboard((GdkDisplay*)[self castedGObject]);

	OGdkClipboard* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)settingWithName:(OFString*)name value:(GValue*)value
{
	bool returnValue = (bool)gdk_display_get_setting((GdkDisplay*)[self castedGObject], [name UTF8String], value);

	return returnValue;
}

- (OFString*)startupNotificationId
{
	const char* gobjectValue = gdk_display_get_startup_notification_id((GdkDisplay*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isClosed
{
	bool returnValue = (bool)gdk_display_is_closed((GdkDisplay*)[self castedGObject]);

	return returnValue;
}

- (bool)isComposited
{
	bool returnValue = (bool)gdk_display_is_composited((GdkDisplay*)[self castedGObject]);

	return returnValue;
}

- (bool)isRgba
{
	bool returnValue = (bool)gdk_display_is_rgba((GdkDisplay*)[self castedGObject]);

	return returnValue;
}

- (GList*)listSeats
{
	GList* returnValue = (GList*)gdk_display_list_seats((GdkDisplay*)[self castedGObject]);

	return returnValue;
}

- (bool)mapKeycode:(guint)keycode keys:(GdkKeymapKey**)keys keyvals:(guint**)keyvals nentries:(int*)nentries
{
	bool returnValue = (bool)gdk_display_map_keycode((GdkDisplay*)[self castedGObject], keycode, keys, keyvals, nentries);

	return returnValue;
}

- (bool)mapKeyval:(guint)keyval keys:(GdkKeymapKey**)keys nkeys:(int*)nkeys
{
	bool returnValue = (bool)gdk_display_map_keyval((GdkDisplay*)[self castedGObject], keyval, keys, nkeys);

	return returnValue;
}

- (void)notifyStartupCompleteWithStartupId:(OFString*)startupId
{
	gdk_display_notify_startup_complete((GdkDisplay*)[self castedGObject], [startupId UTF8String]);
}

- (bool)prepareGl
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_display_prepare_gl((GdkDisplay*)[self castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)putEvent:(GdkEvent*)event
{
	gdk_display_put_event((GdkDisplay*)[self castedGObject], event);
}

- (bool)supportsInputShapes
{
	bool returnValue = (bool)gdk_display_supports_input_shapes((GdkDisplay*)[self castedGObject]);

	return returnValue;
}

- (bool)supportsShadowWidth
{
	bool returnValue = (bool)gdk_display_supports_shadow_width((GdkDisplay*)[self castedGObject]);

	return returnValue;
}

- (void)sync
{
	gdk_display_sync((GdkDisplay*)[self castedGObject]);
}

- (bool)translateKeyWithKeycode:(guint)keycode state:(GdkModifierType)state group:(int)group keyval:(guint*)keyval effectiveGroup:(int*)effectiveGroup level:(int*)level consumed:(GdkModifierType*)consumed
{
	bool returnValue = (bool)gdk_display_translate_key((GdkDisplay*)[self castedGObject], keycode, state, group, keyval, effectiveGroup, level, consumed);

	return returnValue;
}


@end