/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIconPaintable.h"

@implementation OGTKIconPaintable

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ICON_PAINTABLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ICON_PAINTABLE);
	return gObjectClass;
}

+ (instancetype)iconPaintableForFile:(GFile*)file size:(int)size scale:(int)scale
{
	GtkIconPaintable* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_icon_paintable_new_for_file(file, size, scale), GTK_TYPE_ICON_PAINTABLE, GtkIconPaintable);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKIconPaintable* wrapperObject;
	@try {
		wrapperObject = [[OGTKIconPaintable alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkIconPaintable*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ICON_PAINTABLE, GtkIconPaintable);
}

- (GFile*)file
{
	GFile* returnValue = (GFile*)gtk_icon_paintable_get_file((GtkIconPaintable*)[self castedGObject]);

	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_icon_paintable_get_icon_name((GtkIconPaintable*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isSymbolic
{
	bool returnValue = (bool)gtk_icon_paintable_is_symbolic((GtkIconPaintable*)[self castedGObject]);

	return returnValue;
}


@end