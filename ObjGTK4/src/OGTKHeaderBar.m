/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKHeaderBar.h"

@implementation OGTKHeaderBar

- (instancetype)init
{
	GtkHeaderBar* gobjectValue = GTK_HEADER_BAR(gtk_header_bar_new());

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

- (GtkHeaderBar*)castedGObject
{
	return GTK_HEADER_BAR([self gObject]);
}

- (OFString*)decorationLayout
{
	const char* gobjectValue = gtk_header_bar_get_decoration_layout([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)showTitleButtons
{
	bool returnValue = gtk_header_bar_get_show_title_buttons([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)titleWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_header_bar_get_title_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)packEnd:(OGTKWidget*)child
{
	gtk_header_bar_pack_end([self castedGObject], [child castedGObject]);
}

- (void)packStart:(OGTKWidget*)child
{
	gtk_header_bar_pack_start([self castedGObject], [child castedGObject]);
}

- (void)remove:(OGTKWidget*)child
{
	gtk_header_bar_remove([self castedGObject], [child castedGObject]);
}

- (void)setDecorationLayout:(OFString*)layout
{
	gtk_header_bar_set_decoration_layout([self castedGObject], [layout UTF8String]);
}

- (void)setShowTitleButtons:(bool)setting
{
	gtk_header_bar_set_show_title_buttons([self castedGObject], setting);
}

- (void)setTitleWidget:(OGTKWidget*)titleWidget
{
	gtk_header_bar_set_title_widget([self castedGObject], [titleWidget castedGObject]);
}


@end