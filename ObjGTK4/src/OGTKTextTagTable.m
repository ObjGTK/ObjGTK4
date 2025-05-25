/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextTagTable.h"

#import "OGTKTextTag.h"

@implementation OGTKTextTagTable

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TEXT_TAG_TABLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TEXT_TAG_TABLE);
	return gObjectClass;
}

+ (instancetype)textTagTable
{
	GtkTextTagTable* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_tag_table_new(), GTK_TYPE_TEXT_TAG_TABLE, GtkTextTagTable);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKTextTagTable* wrapperObject;
	@try {
		wrapperObject = [[OGTKTextTagTable alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTextTagTable*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TEXT_TAG_TABLE, GtkTextTagTable);
}

- (bool)addWithTag:(OGTKTextTag*)tag
{
	bool returnValue = (bool)gtk_text_tag_table_add((GtkTextTagTable*)[self castedGObject], [tag castedGObject]);

	return returnValue;
}

- (void)foreachWithFunc:(GtkTextTagTableForeach)func data:(gpointer)data
{
	gtk_text_tag_table_foreach((GtkTextTagTable*)[self castedGObject], func, data);
}

- (int)size
{
	int returnValue = (int)gtk_text_tag_table_get_size((GtkTextTagTable*)[self castedGObject]);

	return returnValue;
}

- (OGTKTextTag*)lookupWithName:(OFString*)name
{
	GtkTextTag* gobjectValue = gtk_text_tag_table_lookup((GtkTextTagTable*)[self castedGObject], [name UTF8String]);

	OGTKTextTag* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)removeWithTag:(OGTKTextTag*)tag
{
	gtk_text_tag_table_remove((GtkTextTagTable*)[self castedGObject], [tag castedGObject]);
}


@end