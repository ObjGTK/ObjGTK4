/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIconTheme.h"

#import <OGdk4/OGdkDisplay.h>
#import "OGTKIconPaintable.h"

@implementation OGTKIconTheme

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ICON_THEME;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGTKIconTheme*)forDisplay:(OGdkDisplay*)display
{
	GtkIconTheme* gobjectValue = gtk_icon_theme_get_for_display([display castedGObject]);

	OGTKIconTheme* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

+ (instancetype)iconTheme
{
	GtkIconTheme* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_icon_theme_new(), GtkIconTheme, GtkIconTheme);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKIconTheme* wrapperObject;
	@try {
		wrapperObject = [[OGTKIconTheme alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkIconTheme*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkIconTheme, GtkIconTheme);
}

- (void)addResourcePath:(OFString*)path
{
	gtk_icon_theme_add_resource_path([self castedGObject], [path UTF8String]);
}

- (void)addSearchPath:(OFString*)path
{
	gtk_icon_theme_add_search_path([self castedGObject], [path UTF8String]);
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gtk_icon_theme_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (char**)iconNames
{
	char** returnValue = (char**)gtk_icon_theme_get_icon_names([self castedGObject]);

	return returnValue;
}

- (int*)iconSizesWithIconName:(OFString*)iconName
{
	int* returnValue = (int*)gtk_icon_theme_get_icon_sizes([self castedGObject], [iconName UTF8String]);

	return returnValue;
}

- (char**)resourcePath
{
	char** returnValue = (char**)gtk_icon_theme_get_resource_path([self castedGObject]);

	return returnValue;
}

- (char**)searchPath
{
	char** returnValue = (char**)gtk_icon_theme_get_search_path([self castedGObject]);

	return returnValue;
}

- (OFString*)themeName
{
	char* gobjectValue = gtk_icon_theme_get_theme_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)hasGicon:(GIcon*)gicon
{
	bool returnValue = (bool)gtk_icon_theme_has_gicon([self castedGObject], gicon);

	return returnValue;
}

- (bool)hasIconWithIconName:(OFString*)iconName
{
	bool returnValue = (bool)gtk_icon_theme_has_icon([self castedGObject], [iconName UTF8String]);

	return returnValue;
}

- (OGTKIconPaintable*)lookupByGicon:(GIcon*)icon size:(int)size scale:(int)scale direction:(GtkTextDirection)direction flags:(GtkIconLookupFlags)flags
{
	GtkIconPaintable* gobjectValue = gtk_icon_theme_lookup_by_gicon([self castedGObject], icon, size, scale, direction, flags);

	OGTKIconPaintable* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGTKIconPaintable*)lookupIconWithIconName:(OFString*)iconName fallbacks:(const char**)fallbacks size:(int)size scale:(int)scale direction:(GtkTextDirection)direction flags:(GtkIconLookupFlags)flags
{
	GtkIconPaintable* gobjectValue = gtk_icon_theme_lookup_icon([self castedGObject], [iconName UTF8String], fallbacks, size, scale, direction, flags);

	OGTKIconPaintable* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
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