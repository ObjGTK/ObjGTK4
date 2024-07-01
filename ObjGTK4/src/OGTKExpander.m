/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKExpander.h"

@implementation OGTKExpander

- (instancetype)init:(OFString*)label
{
	GtkExpander* gobjectValue = GTK_EXPANDER(gtk_expander_new([label UTF8String]));

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

- (instancetype)initWithMnemonic:(OFString*)label
{
	GtkExpander* gobjectValue = GTK_EXPANDER(gtk_expander_new_with_mnemonic([label UTF8String]));

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

- (GtkExpander*)castedGObject
{
	return GTK_EXPANDER([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_expander_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)expanded
{
	bool returnValue = gtk_expander_get_expanded([self castedGObject]);

	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_expander_get_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)labelWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_expander_get_label_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)resizeToplevel
{
	bool returnValue = gtk_expander_get_resize_toplevel([self castedGObject]);

	return returnValue;
}

- (bool)useMarkup
{
	bool returnValue = gtk_expander_get_use_markup([self castedGObject]);

	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = gtk_expander_get_use_underline([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_expander_set_child([self castedGObject], [child castedGObject]);
}

- (void)setExpanded:(bool)expanded
{
	gtk_expander_set_expanded([self castedGObject], expanded);
}

- (void)setLabel:(OFString*)label
{
	gtk_expander_set_label([self castedGObject], [label UTF8String]);
}

- (void)setLabelWidget:(OGTKWidget*)labelWidget
{
	gtk_expander_set_label_widget([self castedGObject], [labelWidget castedGObject]);
}

- (void)setResizeToplevel:(bool)resizeToplevel
{
	gtk_expander_set_resize_toplevel([self castedGObject], resizeToplevel);
}

- (void)setUseMarkup:(bool)useMarkup
{
	gtk_expander_set_use_markup([self castedGObject], useMarkup);
}

- (void)setUseUnderline:(bool)useUnderline
{
	gtk_expander_set_use_underline([self castedGObject], useUnderline);
}


@end