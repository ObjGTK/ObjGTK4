/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBookmarkList.h"

@implementation OGTKBookmarkList

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BOOKMARK_LIST;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithFilename:(OFString*)filename attributes:(OFString*)attributes
{
	GtkBookmarkList* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_bookmark_list_new([filename UTF8String], [attributes UTF8String]), GtkBookmarkList, GtkBookmarkList);

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

- (GtkBookmarkList*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkBookmarkList, GtkBookmarkList);
}

- (OFString*)attributes
{
	const char* gobjectValue = gtk_bookmark_list_get_attributes([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)filename
{
	const char* gobjectValue = gtk_bookmark_list_get_filename([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)ioPriority
{
	int returnValue = (int)gtk_bookmark_list_get_io_priority([self castedGObject]);

	return returnValue;
}

- (bool)isLoading
{
	bool returnValue = (bool)gtk_bookmark_list_is_loading([self castedGObject]);

	return returnValue;
}

- (void)setAttributes:(OFString*)attributes
{
	gtk_bookmark_list_set_attributes([self castedGObject], [attributes UTF8String]);
}

- (void)setIoPriority:(int)ioPriority
{
	gtk_bookmark_list_set_io_priority([self castedGObject], ioPriority);
}


@end