/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLinkButton.h"

#import "OGTKWidget.h"

@implementation OGTKLinkButton

- (instancetype)init:(OFString*)uri
{
	GtkLinkButton* gobjectValue = GTK_LINK_BUTTON(gtk_link_button_new([uri UTF8String]));

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

- (instancetype)initWithLabelWithUri:(OFString*)uri label:(OFString*)label
{
	GtkLinkButton* gobjectValue = GTK_LINK_BUTTON(gtk_link_button_new_with_label([uri UTF8String], [label UTF8String]));

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

- (GtkLinkButton*)castedGObject
{
	return GTK_LINK_BUTTON([self gObject]);
}

- (OFString*)uri
{
	const char* gobjectValue = gtk_link_button_get_uri([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)visited
{
	bool returnValue = gtk_link_button_get_visited([self castedGObject]);

	return returnValue;
}

- (void)setUri:(OFString*)uri
{
	gtk_link_button_set_uri([self castedGObject], [uri UTF8String]);
}

- (void)setVisited:(bool)visited
{
	gtk_link_button_set_visited([self castedGObject], visited);
}


@end