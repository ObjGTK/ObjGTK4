/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIconTheme.h"

#import "OGTKIconPaintable.h"
#import <OGdk4/OGGdkDisplay.h>

@implementation OGTKIconTheme

+ (OGTKIconTheme*)forDisplay:(OGGdkDisplay*)display
{
	GtkIconTheme* gobjectValue = GTK_ICON_THEME(gtk_icon_theme_get_for_display([display castedGObject]));

	OGTKIconTheme* returnValue = [OGTKIconTheme withGObject:gobjectValue];
	return returnValue;
}

- (instancetype)init
{
	GtkIconTheme* gobjectValue = GTK_ICON_THEME(gtk_icon_theme_new());

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

- (GtkIconTheme*)castedGObject
{
	return GTK_ICON_THEME([self gObject]);
}

- (void)addResourcePath:(OFString*)path
{
	gtk_icon_theme_add_resource_path([self castedGObject], [path UTF8String]);
}

- (void)addSearchPath:(OFString*)path
{
	gtk_icon_theme_add_search_path([self castedGObject], [path UTF8String]);
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gtk_icon_theme_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (char**)iconNames
{
	char** returnValue = gtk_icon_theme_get_icon_names([self castedGObject]);

	return returnValue;
}

- (int*)iconSizes:(OFString*)iconName
{
	int* returnValue = gtk_icon_theme_get_icon_sizes([self castedGObject], [iconName UTF8String]);

	return returnValue;
}

- (char**)resourcePath
{
	char** returnValue = gtk_icon_theme_get_resource_path([self castedGObject]);

	return returnValue;
}

- (char**)searchPath
{
	char** returnValue = gtk_icon_theme_get_search_path([self castedGObject]);

	return returnValue;
}

- (char*)themeName
{
	char* gobjectValue = gtk_icon_theme_get_theme_name([self castedGObject]);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (bool)hasGicon:(GIcon*)gicon
{
	bool returnValue = gtk_icon_theme_has_gicon([self castedGObject], gicon);

	return returnValue;
}

- (bool)hasIcon:(OFString*)iconName
{
	bool returnValue = gtk_icon_theme_has_icon([self castedGObject], [iconName UTF8String]);

	return returnValue;
}

- (OGTKIconPaintable*)lookupByGiconWithIcon:(GIcon*)icon size:(int)size scale:(int)scale direction:(GtkTextDirection)direction flags:(GtkIconLookupFlags)flags
{
	GtkIconPaintable* gobjectValue = GTK_ICON_PAINTABLE(gtk_icon_theme_lookup_by_gicon([self castedGObject], icon, size, scale, direction, flags));

	OGTKIconPaintable* returnValue = [OGTKIconPaintable withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGTKIconPaintable*)lookupIconWithIconName:(OFString*)iconName fallbacks:(const char**)fallbacks size:(int)size scale:(int)scale direction:(GtkTextDirection)direction flags:(GtkIconLookupFlags)flags
{
	GtkIconPaintable* gobjectValue = GTK_ICON_PAINTABLE(gtk_icon_theme_lookup_icon([self castedGObject], [iconName UTF8String], fallbacks, size, scale, direction, flags));

	OGTKIconPaintable* returnValue = [OGTKIconPaintable withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setResourcePath:(const char* const*)path
{
	gtk_icon_theme_set_resource_path([self castedGObject], path);
}

- (void)setSearchPath:(const char* const*)path
{
	gtk_icon_theme_set_search_path([self castedGObject], path);
}

- (void)setThemeName:(OFString*)themeName
{
	gtk_icon_theme_set_theme_name([self castedGObject], [themeName UTF8String]);
}


@end