/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextTagTable.h"

#import "OGTKTextTag.h"

@implementation OGTKTextTagTable

- (instancetype)init
{
	GtkTextTagTable* gobjectValue = GTK_TEXT_TAG_TABLE(gtk_text_tag_table_new());

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

- (GtkTextTagTable*)castedGObject
{
	return GTK_TEXT_TAG_TABLE([self gObject]);
}

- (bool)add:(OGTKTextTag*)tag
{
	bool returnValue = gtk_text_tag_table_add([self castedGObject], [tag castedGObject]);

	return returnValue;
}

- (void)foreachWithFunc:(GtkTextTagTableForeach)func data:(gpointer)data
{
	gtk_text_tag_table_foreach([self castedGObject], func, data);
}

- (int)size
{
	int returnValue = gtk_text_tag_table_get_size([self castedGObject]);

	return returnValue;
}

- (OGTKTextTag*)lookup:(OFString*)name
{
	GtkTextTag* gobjectValue = GTK_TEXT_TAG(gtk_text_tag_table_lookup([self castedGObject], [name UTF8String]));

	OGTKTextTag* returnValue = [OGTKTextTag withGObject:gobjectValue];
	return returnValue;
}

- (void)remove:(OGTKTextTag*)tag
{
	gtk_text_tag_table_remove([self castedGObject], [tag castedGObject]);
}


@end