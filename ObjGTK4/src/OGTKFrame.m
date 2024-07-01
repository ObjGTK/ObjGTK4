/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFrame.h"

@implementation OGTKFrame

- (instancetype)init:(OFString*)label
{
	GtkFrame* gobjectValue = GTK_FRAME(gtk_frame_new([label UTF8String]));

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

- (GtkFrame*)castedGObject
{
	return GTK_FRAME([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_frame_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_frame_get_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (float)labelAlign
{
	float returnValue = gtk_frame_get_label_align([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)labelWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_frame_get_label_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_frame_set_child([self castedGObject], [child castedGObject]);
}

- (void)setLabel:(OFString*)label
{
	gtk_frame_set_label([self castedGObject], [label UTF8String]);
}

- (void)setLabelAlign:(float)xalign
{
	gtk_frame_set_label_align([self castedGObject], xalign);
}

- (void)setLabelWidget:(OGTKWidget*)labelWidget
{
	gtk_frame_set_label_widget([self castedGObject], [labelWidget castedGObject]);
}


@end