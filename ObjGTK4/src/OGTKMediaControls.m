/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMediaControls.h"

#import "OGTKMediaStream.h"

@implementation OGTKMediaControls

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MEDIA_CONTROLS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_MEDIA_CONTROLS);
	return gObjectClass;
}

+ (instancetype)mediaControlsWithStream:(OGTKMediaStream*)stream
{
	GtkMediaControls* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_controls_new([stream castedGObject]), GTK_TYPE_MEDIA_CONTROLS, GtkMediaControls);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKMediaControls* wrapperObject;
	@try {
		wrapperObject = [[OGTKMediaControls alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkMediaControls*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_MEDIA_CONTROLS, GtkMediaControls);
}

- (OGTKMediaStream*)mediaStream
{
	GtkMediaStream* gobjectValue = gtk_media_controls_get_media_stream((GtkMediaControls*)[self castedGObject]);

	OGTKMediaStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setMediaStream:(OGTKMediaStream*)stream
{
	gtk_media_controls_set_media_stream((GtkMediaControls*)[self castedGObject], [stream castedGObject]);
}


@end