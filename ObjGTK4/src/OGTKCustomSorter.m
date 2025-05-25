/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCustomSorter.h"

@implementation OGTKCustomSorter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CUSTOM_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CUSTOM_SORTER);
	return gObjectClass;
}

+ (instancetype)customSorterWithSortFunc:(GCompareDataFunc)sortFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	GtkCustomSorter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_custom_sorter_new(sortFunc, userData, userDestroy), GTK_TYPE_CUSTOM_SORTER, GtkCustomSorter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKCustomSorter* wrapperObject;
	@try {
		wrapperObject = [[OGTKCustomSorter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCustomSorter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CUSTOM_SORTER, GtkCustomSorter);
}

- (void)setSortFunc:(GCompareDataFunc)sortFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	gtk_custom_sorter_set_sort_func((GtkCustomSorter*)[self castedGObject], sortFunc, userData, userDestroy);
}


@end