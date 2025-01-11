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

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_DISPLAY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGdkDisplay*)default
{
	GdkDisplay* gobjectValue = gdk_display_get_default();

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

+ (OGdkDisplay*)open:(OFString*)displayName
{
	GdkDisplay* gobjectValue = gdk_display_open([displayName UTF8String]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkDisplay*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkDisplay, GdkDisplay);
}

- (void)beep
{
	gdk_display_beep([self castedGObject]);
}

- (void)close
{
	gdk_display_close([self castedGObject]);
}

- (OGdkGLContext*)createGlContext
{
	GError* err = NULL;

	GdkGLContext* gobjectValue = gdk_display_create_gl_context([self castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkGLContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)deviceIsGrabbed:(OGdkDevice*)device
{
	bool returnValue = (bool)gdk_display_device_is_grabbed([self castedGObject], [device castedGObject]);

	return returnValue;
}

- (void)flush
{
	gdk_display_flush([self castedGObject]);
}

- (OGdkAppLaunchContext*)appLaunchContext
{
	GdkAppLaunchContext* gobjectValue = gdk_display_get_app_launch_context([self castedGObject]);

	OGdkAppLaunchContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGdkClipboard*)clipboard
{
	GdkClipboard* gobjectValue = gdk_display_get_clipboard([self castedGObject]);

	OGdkClipboard* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkSeat*)defaultSeat
{
	GdkSeat* gobjectValue = gdk_display_get_default_seat([self castedGObject]);

	OGdkSeat* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkDmabufFormats*)dmabufFormats
{
	GdkDmabufFormats* returnValue = (GdkDmabufFormats*)gdk_display_get_dmabuf_formats([self castedGObject]);

	return returnValue;
}

- (OGdkMonitor*)monitorAtSurface:(OGdkSurface*)surface
{
	GdkMonitor* gobjectValue = gdk_display_get_monitor_at_surface([self castedGObject], [surface castedGObject]);

	OGdkMonitor* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GListModel*)monitors
{
	GListModel* returnValue = (GListModel*)gdk_display_get_monitors([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gdk_display_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGdkClipboard*)primaryClipboard
{
	GdkClipboard* gobjectValue = gdk_display_get_primary_clipboard([self castedGObject]);

	OGdkClipboard* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)settingWithName:(OFString*)name value:(GValue*)value
{
	bool returnValue = (bool)gdk_display_get_setting([self castedGObject], [name UTF8String], value);

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
	bool returnValue = (bool)gdk_display_is_closed([self castedGObject]);

	return returnValue;
}

- (bool)isComposited
{
	bool returnValue = (bool)gdk_display_is_composited([self castedGObject]);

	return returnValue;
}

- (bool)isRgba
{
	bool returnValue = (bool)gdk_display_is_rgba([self castedGObject]);

	return returnValue;
}

- (GList*)listSeats
{
	GList* returnValue = (GList*)gdk_display_list_seats([self castedGObject]);

	return returnValue;
}

- (bool)mapKeycodeWithKeycode:(guint)keycode keys:(GdkKeymapKey**)keys keyvals:(guint**)keyvals nentries:(int*)nentries
{
	bool returnValue = (bool)gdk_display_map_keycode([self castedGObject], keycode, keys, keyvals, nentries);

	return returnValue;
}

- (bool)mapKeyvalWithKeyval:(guint)keyval keys:(GdkKeymapKey**)keys nkeys:(int*)nkeys
{
	bool returnValue = (bool)gdk_display_map_keyval([self castedGObject], keyval, keys, nkeys);

	return returnValue;
}

- (void)notifyStartupComplete:(OFString*)startupId
{
	gdk_display_notify_startup_complete([self castedGObject], [startupId UTF8String]);
}

- (bool)prepareGl
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_display_prepare_gl([self castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)putEvent:(GdkEvent*)event
{
	gdk_display_put_event([self castedGObject], event);
}

- (bool)supportsInputShapes
{
	bool returnValue = (bool)gdk_display_supports_input_shapes([self castedGObject]);

	return returnValue;
}

- (bool)supportsShadowWidth
{
	bool returnValue = (bool)gdk_display_supports_shadow_width([self castedGObject]);

	return returnValue;
}

- (void)sync
{
	gdk_display_sync([self castedGObject]);
}

- (bool)translateKeyWithKeycode:(guint)keycode state:(GdkModifierType)state group:(int)group keyval:(guint*)keyval effectiveGroup:(int*)effectiveGroup level:(int*)level consumed:(GdkModifierType*)consumed
{
	bool returnValue = (bool)gdk_display_translate_key([self castedGObject], keycode, state, group, keyval, effectiveGroup, level, consumed);

	return returnValue;
}


@end