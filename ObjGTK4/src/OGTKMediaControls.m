/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMediaControls.h"

#import "OGTKMediaStream.h"

@implementation OGTKMediaControls

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MEDIA_CONTROLS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithStream:(OGTKMediaStream*)stream
{
	GtkMediaControls* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_controls_new([stream castedGObject]), GtkMediaControls, GtkMediaControls);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkMediaControls, GtkMediaControls);
}

- (OGTKMediaStream*)mediaStream
{
	GtkMediaStream* gobjectValue = gtk_media_controls_get_media_stream([self castedGObject]);

	OGTKMediaStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setMediaStream:(OGTKMediaStream*)stream
{
	gtk_media_controls_set_media_stream([self castedGObject], [stream castedGObject]);
}


@end