/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindowControls.h"

@implementation OGTKWindowControls

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_WINDOW_CONTROLS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithSide:(GtkPackType)side
{
	GtkWindowControls* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_window_controls_new(side), GtkWindowControls, GtkWindowControls);

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

- (GtkWindowControls*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkWindowControls, GtkWindowControls);
}

- (OFString*)decorationLayout
{
	const char* gobjectValue = gtk_window_controls_get_decoration_layout([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)empty
{
	bool returnValue = (bool)gtk_window_controls_get_empty([self castedGObject]);

	return returnValue;
}

- (GtkPackType)side
{
	GtkPackType returnValue = (GtkPackType)gtk_window_controls_get_side([self castedGObject]);

	return returnValue;
}

- (void)setDecorationLayout:(OFString*)layout
{
	gtk_window_controls_set_decoration_layout([self castedGObject], [layout UTF8String]);
}

- (void)setSide:(GtkPackType)side
{
	gtk_window_controls_set_side([self castedGObject], side);
}


@end