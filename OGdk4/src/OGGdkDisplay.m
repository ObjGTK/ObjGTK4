/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkDisplay.h"

#import "OGGdkAppLaunchContext.h"
#import "OGGdkMonitor.h"
#import "OGGdkClipboard.h"
#import "OGGdkDevice.h"
#import "OGGdkSeat.h"
#import "OGGdkGLContext.h"
#import "OGGdkSurface.h"

@implementation OGGdkDisplay

+ (OGGdkDisplay*)default
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_display_get_default());

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

+ (OGGdkDisplay*)open:(OFString*)displayName
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_display_open([displayName UTF8String]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (GdkDisplay*)castedGObject
{
	return GDK_DISPLAY([self gObject]);
}

- (void)beep
{
	gdk_display_beep([self castedGObject]);
}

- (void)close
{
	gdk_display_close([self castedGObject]);
}

- (OGGdkGLContext*)createGlContext
{
	GError* err = NULL;

	GdkGLContext* gobjectValue = GDK_GL_CONTEXT(gdk_display_create_gl_context([self castedGObject], &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGGdkGLContext* returnValue = [OGGdkGLContext withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)deviceIsGrabbed:(OGGdkDevice*)device
{
	bool returnValue = gdk_display_device_is_grabbed([self castedGObject], [device castedGObject]);

	return returnValue;
}

- (void)flush
{
	gdk_display_flush([self castedGObject]);
}

- (OGGdkAppLaunchContext*)appLaunchContext
{
	GdkAppLaunchContext* gobjectValue = GDK_APP_LAUNCH_CONTEXT(gdk_display_get_app_launch_context([self castedGObject]));

	OGGdkAppLaunchContext* returnValue = [OGGdkAppLaunchContext withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGGdkClipboard*)clipboard
{
	GdkClipboard* gobjectValue = GDK_CLIPBOARD(gdk_display_get_clipboard([self castedGObject]));

	OGGdkClipboard* returnValue = [OGGdkClipboard withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkSeat*)defaultSeat
{
	GdkSeat* gobjectValue = GDK_SEAT(gdk_display_get_default_seat([self castedGObject]));

	OGGdkSeat* returnValue = [OGGdkSeat withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkMonitor*)monitorAtSurface:(OGGdkSurface*)surface
{
	GdkMonitor* gobjectValue = GDK_MONITOR(gdk_display_get_monitor_at_surface([self castedGObject], [surface castedGObject]));

	OGGdkMonitor* returnValue = [OGGdkMonitor withGObject:gobjectValue];
	return returnValue;
}

- (GListModel*)monitors
{
	GListModel* returnValue = gdk_display_get_monitors([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gdk_display_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGGdkClipboard*)primaryClipboard
{
	GdkClipboard* gobjectValue = GDK_CLIPBOARD(gdk_display_get_primary_clipboard([self castedGObject]));

	OGGdkClipboard* returnValue = [OGGdkClipboard withGObject:gobjectValue];
	return returnValue;
}

- (bool)settingWithName:(OFString*)name value:(GValue*)value
{
	bool returnValue = gdk_display_get_setting([self castedGObject], [name UTF8String], value);

	return returnValue;
}

- (OFString*)startupNotificationId
{
	const char* gobjectValue = gdk_display_get_startup_notification_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isClosed
{
	bool returnValue = gdk_display_is_closed([self castedGObject]);

	return returnValue;
}

- (bool)isComposited
{
	bool returnValue = gdk_display_is_composited([self castedGObject]);

	return returnValue;
}

- (bool)isRgba
{
	bool returnValue = gdk_display_is_rgba([self castedGObject]);

	return returnValue;
}

- (GList*)listSeats
{
	GList* returnValue = gdk_display_list_seats([self castedGObject]);

	return returnValue;
}

- (bool)mapKeycodeWithKeycode:(guint)keycode keys:(GdkKeymapKey**)keys keyvals:(guint**)keyvals nentries:(int*)nentries
{
	bool returnValue = gdk_display_map_keycode([self castedGObject], keycode, keys, keyvals, nentries);

	return returnValue;
}

- (bool)mapKeyvalWithKeyval:(guint)keyval keys:(GdkKeymapKey**)keys nkeys:(int*)nkeys
{
	bool returnValue = gdk_display_map_keyval([self castedGObject], keyval, keys, nkeys);

	return returnValue;
}

- (void)notifyStartupComplete:(OFString*)startupId
{
	gdk_display_notify_startup_complete([self castedGObject], [startupId UTF8String]);
}

- (bool)prepareGl
{
	GError* err = NULL;

	bool returnValue = gdk_display_prepare_gl([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)putEvent:(GdkEvent*)event
{
	gdk_display_put_event([self castedGObject], event);
}

- (bool)supportsInputShapes
{
	bool returnValue = gdk_display_supports_input_shapes([self castedGObject]);

	return returnValue;
}

- (void)sync
{
	gdk_display_sync([self castedGObject]);
}

- (bool)translateKeyWithKeycode:(guint)keycode state:(GdkModifierType)state group:(int)group keyval:(guint*)keyval effectiveGroup:(int*)effectiveGroup level:(int*)level consumed:(GdkModifierType*)consumed
{
	bool returnValue = gdk_display_translate_key([self castedGObject], keycode, state, group, keyval, effectiveGroup, level, consumed);

	return returnValue;
}


@end