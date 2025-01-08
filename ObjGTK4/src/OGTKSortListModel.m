/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSortListModel.h"

#import "OGTKSorter.h"

@implementation OGTKSortListModel

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SORT_LIST_MODEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithModel:(GListModel*)model sorter:(OGTKSorter*)sorter
{
	GtkSortListModel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_sort_list_model_new(model, [sorter castedGObject]), GtkSortListModel, GtkSortListModel);

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

- (GtkSortListModel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkSortListModel, GtkSortListModel);
}

- (bool)incremental
{
	bool returnValue = (bool)gtk_sort_list_model_get_incremental([self castedGObject]);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_sort_list_model_get_model([self castedGObject]);

	return returnValue;
}

- (guint)pending
{
	guint returnValue = (guint)gtk_sort_list_model_get_pending([self castedGObject]);

	return returnValue;
}

- (OGTKSorter*)sectionSorter
{
	GtkSorter* gobjectValue = gtk_sort_list_model_get_section_sorter([self castedGObject]);

	OGTKSorter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKSorter*)sorter
{
	GtkSorter* gobjectValue = gtk_sort_list_model_get_sorter([self castedGObject]);

	OGTKSorter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setIncremental:(bool)incremental
{
	gtk_sort_list_model_set_incremental([self castedGObject], incremental);
}

- (void)setModel:(GListModel*)model
{
	gtk_sort_list_model_set_model([self castedGObject], model);
}

- (void)setSectionSorter:(OGTKSorter*)sorter
{
	gtk_sort_list_model_set_section_sorter([self castedGObject], [sorter castedGObject]);
}

- (void)setSorter:(OGTKSorter*)sorter
{
	gtk_sort_list_model_set_sorter([self castedGObject], [sorter castedGObject]);
}


@end