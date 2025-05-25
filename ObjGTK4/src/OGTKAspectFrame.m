/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAspectFrame.h"

@implementation OGTKAspectFrame

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ASPECT_FRAME;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ASPECT_FRAME);
	return gObjectClass;
}

+ (instancetype)aspectFrameWithXalign:(float)xalign yalign:(float)yalign ratio:(float)ratio obeyChild:(bool)obeyChild
{
	GtkAspectFrame* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_aspect_frame_new(xalign, yalign, ratio, obeyChild), GTK_TYPE_ASPECT_FRAME, GtkAspectFrame);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKAspectFrame* wrapperObject;
	@try {
		wrapperObject = [[OGTKAspectFrame alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAspectFrame*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ASPECT_FRAME, GtkAspectFrame);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_aspect_frame_get_child((GtkAspectFrame*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)obeyChild
{
	bool returnValue = (bool)gtk_aspect_frame_get_obey_child((GtkAspectFrame*)[self castedGObject]);

	return returnValue;
}

- (float)ratio
{
	float returnValue = (float)gtk_aspect_frame_get_ratio((GtkAspectFrame*)[self castedGObject]);

	return returnValue;
}

- (float)xalign
{
	float returnValue = (float)gtk_aspect_frame_get_xalign((GtkAspectFrame*)[self castedGObject]);

	return returnValue;
}

- (float)yalign
{
	float returnValue = (float)gtk_aspect_frame_get_yalign((GtkAspectFrame*)[self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_aspect_frame_set_child((GtkAspectFrame*)[self castedGObject], [child castedGObject]);
}

- (void)setObeyChild:(bool)obeyChild
{
	gtk_aspect_frame_set_obey_child((GtkAspectFrame*)[self castedGObject], obeyChild);
}

- (void)setRatio:(float)ratio
{
	gtk_aspect_frame_set_ratio((GtkAspectFrame*)[self castedGObject], ratio);
}

- (void)setXalign:(float)xalign
{
	gtk_aspect_frame_set_xalign((GtkAspectFrame*)[self castedGObject], xalign);
}

- (void)setYalign:(float)yalign
{
	gtk_aspect_frame_set_yalign((GtkAspectFrame*)[self castedGObject], yalign);
}


@end