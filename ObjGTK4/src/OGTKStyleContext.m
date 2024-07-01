/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStyleContext.h"

#import <OGdk4/OGGdkDisplay.h>

@implementation OGTKStyleContext

+ (void)addProviderForDisplayWithDisplay:(OGGdkDisplay*)display provider:(GtkStyleProvider*)provider priority:(guint)priority
{
	gtk_style_context_add_provider_for_display([display castedGObject], provider, priority);
}

+ (void)removeProviderForDisplayWithDisplay:(OGGdkDisplay*)display provider:(GtkStyleProvider*)provider
{
	gtk_style_context_remove_provider_for_display([display castedGObject], provider);
}

- (GtkStyleContext*)castedGObject
{
	return GTK_STYLE_CONTEXT([self gObject]);
}

- (void)addClass:(OFString*)className
{
	gtk_style_context_add_class([self castedGObject], [className UTF8String]);
}

- (void)addProviderWithProvider:(GtkStyleProvider*)provider priority:(guint)priority
{
	gtk_style_context_add_provider([self castedGObject], provider, priority);
}

- (void)border:(GtkBorder*)border
{
	gtk_style_context_get_border([self castedGObject], border);
}

- (void)color:(GdkRGBA*)color
{
	gtk_style_context_get_color([self castedGObject], color);
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gtk_style_context_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (void)margin:(GtkBorder*)margin
{
	gtk_style_context_get_margin([self castedGObject], margin);
}

- (void)padding:(GtkBorder*)padding
{
	gtk_style_context_get_padding([self castedGObject], padding);
}

- (int)scale
{
	int returnValue = gtk_style_context_get_scale([self castedGObject]);

	return returnValue;
}

- (GtkStateFlags)state
{
	GtkStateFlags returnValue = gtk_style_context_get_state([self castedGObject]);

	return returnValue;
}

- (bool)hasClass:(OFString*)className
{
	bool returnValue = gtk_style_context_has_class([self castedGObject], [className UTF8String]);

	return returnValue;
}

- (bool)lookupColorWithColorName:(OFString*)colorName color:(GdkRGBA*)color
{
	bool returnValue = gtk_style_context_lookup_color([self castedGObject], [colorName UTF8String], color);

	return returnValue;
}

- (void)removeClass:(OFString*)className
{
	gtk_style_context_remove_class([self castedGObject], [className UTF8String]);
}

- (void)removeProvider:(GtkStyleProvider*)provider
{
	gtk_style_context_remove_provider([self castedGObject], provider);
}

- (void)restore
{
	gtk_style_context_restore([self castedGObject]);
}

- (void)save
{
	gtk_style_context_save([self castedGObject]);
}

- (void)setDisplay:(OGGdkDisplay*)display
{
	gtk_style_context_set_display([self castedGObject], [display castedGObject]);
}

- (void)setScale:(int)scale
{
	gtk_style_context_set_scale([self castedGObject], scale);
}

- (void)setState:(GtkStateFlags)flags
{
	gtk_style_context_set_state([self castedGObject], flags);
}

- (char*)toString:(GtkStyleContextPrintFlags)flags
{
	char* gobjectValue = gtk_style_context_to_string([self castedGObject], flags);

	char* returnValue = gobjectValue;
	return returnValue;
}


@end