/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSortListModel.h"

#import "OGTKSorter.h"

@implementation OGTKSortListModel

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SORT_LIST_MODEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SORT_LIST_MODEL);
	return gObjectClass;
}

+ (instancetype)sortListModelWithModel:(GListModel*)model sorter:(OGTKSorter*)sorter
{
	GtkSortListModel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_sort_list_model_new(model, [sorter castedGObject]), GTK_TYPE_SORT_LIST_MODEL, GtkSortListModel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKSortListModel* wrapperObject;
	@try {
		wrapperObject = [[OGTKSortListModel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSortListModel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SORT_LIST_MODEL, GtkSortListModel);
}

- (bool)incremental
{
	bool returnValue = (bool)gtk_sort_list_model_get_incremental((GtkSortListModel*)[self castedGObject]);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_sort_list_model_get_model((GtkSortListModel*)[self castedGObject]);

	return returnValue;
}

- (guint)pending
{
	guint returnValue = (guint)gtk_sort_list_model_get_pending((GtkSortListModel*)[self castedGObject]);

	return returnValue;
}

- (OGTKSorter*)sectionSorter
{
	GtkSorter* gobjectValue = gtk_sort_list_model_get_section_sorter((GtkSortListModel*)[self castedGObject]);

	OGTKSorter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKSorter*)sorter
{
	GtkSorter* gobjectValue = gtk_sort_list_model_get_sorter((GtkSortListModel*)[self castedGObject]);

	OGTKSorter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setIncremental:(bool)incremental
{
	gtk_sort_list_model_set_incremental((GtkSortListModel*)[self castedGObject], incremental);
}

- (void)setModel:(GListModel*)model
{
	gtk_sort_list_model_set_model((GtkSortListModel*)[self castedGObject], model);
}

- (void)setSectionSorter:(OGTKSorter*)sorter
{
	gtk_sort_list_model_set_section_sorter((GtkSortListModel*)[self castedGObject], [sorter castedGObject]);
}

- (void)setSorter:(OGTKSorter*)sorter
{
	gtk_sort_list_model_set_sorter((GtkSortListModel*)[self castedGObject], [sorter castedGObject]);
}


@end