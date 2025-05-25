/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMultiSorter.h"

@implementation OGTKMultiSorter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MULTI_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_MULTI_SORTER);
	return gObjectClass;
}

+ (instancetype)multiSorter
{
	GtkMultiSorter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_multi_sorter_new(), GTK_TYPE_MULTI_SORTER, GtkMultiSorter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKMultiSorter* wrapperObject;
	@try {
		wrapperObject = [[OGTKMultiSorter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkMultiSorter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_MULTI_SORTER, GtkMultiSorter);
}

- (void)appendWithSorter:(OGTKSorter*)sorter
{
	gtk_multi_sorter_append((GtkMultiSorter*)[self castedGObject], [sorter castedGObject]);
}

- (void)removeWithPosition:(guint)position
{
	gtk_multi_sorter_remove((GtkMultiSorter*)[self castedGObject], position);
}


@end