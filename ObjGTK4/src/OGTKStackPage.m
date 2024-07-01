/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStackPage.h"

#import "OGTKWidget.h"

@implementation OGTKStackPage

- (GtkStackPage*)castedGObject
{
	return GTK_STACK_PAGE([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_stack_page_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_stack_page_get_icon_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_stack_page_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)needsAttention
{
	bool returnValue = gtk_stack_page_get_needs_attention([self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_stack_page_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = gtk_stack_page_get_use_underline([self castedGObject]);

	return returnValue;
}

- (bool)visible
{
	bool returnValue = gtk_stack_page_get_visible([self castedGObject]);

	return returnValue;
}

- (void)setIconName:(OFString*)setting
{
	gtk_stack_page_set_icon_name([self castedGObject], [setting UTF8String]);
}

- (void)setName:(OFString*)setting
{
	gtk_stack_page_set_name([self castedGObject], [setting UTF8String]);
}

- (void)setNeedsAttention:(bool)setting
{
	gtk_stack_page_set_needs_attention([self castedGObject], setting);
}

- (void)setTitle:(OFString*)setting
{
	gtk_stack_page_set_title([self castedGObject], [setting UTF8String]);
}

- (void)setUseUnderline:(bool)setting
{
	gtk_stack_page_set_use_underline([self castedGObject], setting);
}

- (void)setVisible:(bool)visible
{
	gtk_stack_page_set_visible([self castedGObject], visible);
}


@end