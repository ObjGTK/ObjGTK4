/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMediaControls.h"

#import "OGTKMediaStream.h"

@implementation OGTKMediaControls

- (instancetype)init:(OGTKMediaStream*)stream
{
	GtkMediaControls* gobjectValue = GTK_MEDIA_CONTROLS(gtk_media_controls_new([stream castedGObject]));

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

- (GtkMediaControls*)castedGObject
{
	return GTK_MEDIA_CONTROLS([self gObject]);
}

- (OGTKMediaStream*)mediaStream
{
	GtkMediaStream* gobjectValue = GTK_MEDIA_STREAM(gtk_media_controls_get_media_stream([self castedGObject]));

	OGTKMediaStream* returnValue = [OGTKMediaStream withGObject:gobjectValue];
	return returnValue;
}

- (void)setMediaStream:(OGTKMediaStream*)stream
{
	gtk_media_controls_set_media_stream([self castedGObject], [stream castedGObject]);
}


@end