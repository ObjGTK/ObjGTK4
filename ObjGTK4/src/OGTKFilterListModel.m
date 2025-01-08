/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilterListModel.h"

#import "OGTKFilter.h"

@implementation OGTKFilterListModel

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FILTER_LIST_MODEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithModel:(GListModel*)model filter:(OGTKFilter*)filter
{
	GtkFilterListModel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_filter_list_model_new(model, [filter castedGObject]), GtkFilterListModel, GtkFilterListModel);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkFilterListModel, GtkFilterListModel);
}

- (OGTKFilter*)filter
{
	GtkFilter* gobjectValue = gtk_filter_list_model_get_filter([self castedGObject]);

	OGTKFilter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)incremental
{
	bool returnValue = (bool)gtk_filter_list_model_get_incremental([self castedGObject]);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_filter_list_model_get_model([self castedGObject]);

	return returnValue;
}

- (guint)pending
{
	guint returnValue = (guint)gtk_filter_list_model_get_pending([self castedGObject]);

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