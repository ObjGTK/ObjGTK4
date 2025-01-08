/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColorButton.h"

@implementation OGTKColorButton

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COLOR_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkColorButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_color_button_new(), GtkColorButton, GtkColorButton);

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

- (instancetype)initWithRgba:(const GdkRGBA*)rgba
{
	GtkColorButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_color_button_new_with_rgba(rgba), GtkColorButton, GtkColorButton);

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

- (GtkColorButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkColorButton, GtkColorButton);
}

- (bool)modal
{
	bool returnValue = (bool)gtk_color_button_get_modal([self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_color_button_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setModal:(bool)modal
{
	gtk_color_button_set_modal([self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_color_button_set_title([self castedGObject], [title UTF8String]);
}


@end