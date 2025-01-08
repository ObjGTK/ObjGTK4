/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAspectFrame.h"

@implementation OGTKAspectFrame

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ASPECT_FRAME;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithXalign:(float)xalign yalign:(float)yalign ratio:(float)ratio obeyChild:(bool)obeyChild
{
	GtkAspectFrame* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_aspect_frame_new(xalign, yalign, ratio, obeyChild), GtkAspectFrame, GtkAspectFrame);

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

- (GtkAspectFrame*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkAspectFrame, GtkAspectFrame);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_aspect_frame_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)obeyChild
{
	bool returnValue = (bool)gtk_aspect_frame_get_obey_child([self castedGObject]);

	return returnValue;
}

- (float)ratio
{
	float returnValue = (float)gtk_aspect_frame_get_ratio([self castedGObject]);

	return returnValue;
}

- (float)xalign
{
	float returnValue = (float)gtk_aspect_frame_get_xalign([self castedGObject]);

	return returnValue;
}

- (float)yalign
{
	float returnValue = (float)gtk_aspect_frame_get_yalign([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_aspect_frame_set_child([self castedGObject], [child castedGObject]);
}

- (void)setObeyChild:(bool)obeyChild
{
	gtk_aspect_frame_set_obey_child([self castedGObject], obeyChild);
}

- (void)setRatio:(float)ratio
{
	gtk_aspect_frame_set_ratio([self castedGObject], ratio);
}

- (void)setXalign:(float)xalign
{
	gtk_aspect_frame_set_xalign([self castedGObject], xalign);
}

- (void)setYalign:(float)yalign
{
	gtk_aspect_frame_set_yalign([self castedGObject], yalign);
}


@end