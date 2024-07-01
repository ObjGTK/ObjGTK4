/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindowControls.h"

@implementation OGTKWindowControls

- (instancetype)init:(GtkPackType)side
{
	GtkWindowControls* gobjectValue = GTK_WINDOW_CONTROLS(gtk_window_controls_new(side));

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
	return GTK_WINDOW_CONTROLS([self gObject]);
}

- (OFString*)decorationLayout
{
	const char* gobjectValue = gtk_window_controls_get_decoration_layout([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)empty
{
	bool returnValue = gtk_window_controls_get_empty([self castedGObject]);

	return returnValue;
}

- (GtkPackType)side
{
	GtkPackType returnValue = gtk_window_controls_get_side([self castedGObject]);

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