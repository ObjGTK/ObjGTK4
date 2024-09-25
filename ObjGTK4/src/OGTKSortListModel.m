/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSortListModel.h"

#import "OGTKSorter.h"

@implementation OGTKSortListModel

- (instancetype)initWithModel:(GListModel*)model sorter:(OGTKSorter*)sorter
{
	GtkSortListModel* gobjectValue = GTK_SORT_LIST_MODEL(gtk_sort_list_model_new(model, [sorter castedGObject]));

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
	return GTK_SORT_LIST_MODEL([self gObject]);
}

- (bool)incremental
{
	bool returnValue = gtk_sort_list_model_get_incremental([self castedGObject]);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = gtk_sort_list_model_get_model([self castedGObject]);

	return returnValue;
}

- (guint)pending
{
	guint returnValue = gtk_sort_list_model_get_pending([self castedGObject]);

	return returnValue;
}

- (OGTKSorter*)sectionSorter
{
	GtkSorter* gobjectValue = GTK_SORTER(gtk_sort_list_model_get_section_sorter([self castedGObject]));

	OGTKSorter* returnValue = [OGTKSorter withGObject:gobjectValue];
	return returnValue;
}

- (OGTKSorter*)sorter
{
	GtkSorter* gobjectValue = GTK_SORTER(gtk_sort_list_model_get_sorter([self castedGObject]));

	OGTKSorter* returnValue = [OGTKSorter withGObject:gobjectValue];
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