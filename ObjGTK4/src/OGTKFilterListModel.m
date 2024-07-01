/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilterListModel.h"

#import "OGTKFilter.h"

@implementation OGTKFilterListModel

- (instancetype)initWithModel:(GListModel*)model filter:(OGTKFilter*)filter
{
	GtkFilterListModel* gobjectValue = GTK_FILTER_LIST_MODEL(gtk_filter_list_model_new(model, [filter castedGObject]));

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

- (GtkFilterListModel*)castedGObject
{
	return GTK_FILTER_LIST_MODEL([self gObject]);
}

- (OGTKFilter*)filter
{
	GtkFilter* gobjectValue = GTK_FILTER(gtk_filter_list_model_get_filter([self castedGObject]));

	OGTKFilter* returnValue = [OGTKFilter withGObject:gobjectValue];
	return returnValue;
}

- (bool)incremental
{
	bool returnValue = gtk_filter_list_model_get_incremental([self castedGObject]);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = gtk_filter_list_model_get_model([self castedGObject]);

	return returnValue;
}

- (guint)pending
{
	guint returnValue = gtk_filter_list_model_get_pending([self castedGObject]);

	return returnValue;
}

- (void)setFilter:(OGTKFilter*)filter
{
	gtk_filter_list_model_set_filter([self castedGObject], [filter castedGObject]);
}

- (void)setIncremental:(bool)incremental
{
	gtk_filter_list_model_set_incremental([self castedGObject], incremental);
}

- (void)setModel:(GListModel*)model
{
	gtk_filter_list_model_set_model([self castedGObject], model);
}


@end