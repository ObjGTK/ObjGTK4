/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindowControls.h"

@implementation OGTKWindowControls

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_WINDOW_CONTROLS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_WINDOW_CONTROLS);
	return gObjectClass;
}

+ (instancetype)windowControlsWithSide:(GtkPackType)side
{
	GtkWindowControls* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_window_controls_new(side), GTK_TYPE_WINDOW_CONTROLS, GtkWindowControls);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKWindowControls* wrapperObject;
	@try {
		wrapperObject = [[OGTKWindowControls alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkWindowControls*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_WINDOW_CONTROLS, GtkWindowControls);
}

- (OFString*)decorationLayout
{
	const char* gobjectValue = gtk_window_controls_get_decoration_layout((GtkWindowControls*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)empty
{
	bool returnValue = (bool)gtk_window_controls_get_empty((GtkWindowControls*)[self castedGObject]);

	return returnValue;
}

- (GtkPackType)side
{
	GtkPackType returnValue = (GtkPackType)gtk_window_controls_get_side((GtkWindowControls*)[self castedGObject]);

	return returnValue;
}

- (void)setDecorationLayout:(OFString*)layout
{
	gtk_window_controls_set_decoration_layout((GtkWindowControls*)[self castedGObject], [layout UTF8String]);
}

- (void)setSide:(GtkPackType)side
{
	gtk_window_controls_set_side((GtkWindowControls*)[self castedGObject], side);
}


@end