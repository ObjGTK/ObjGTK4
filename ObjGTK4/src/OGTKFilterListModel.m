/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilterListModel.h"

#import "OGTKFilter.h"

@implementation OGTKFilterListModel

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FILTER_LIST_MODEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FILTER_LIST_MODEL);
	return gObjectClass;
}

+ (instancetype)filterListModelWithModel:(GListModel*)model filter:(OGTKFilter*)filter
{
	GtkFilterListModel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_filter_list_model_new(model, [filter castedGObject]), GTK_TYPE_FILTER_LIST_MODEL, GtkFilterListModel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKFilterListModel* wrapperObject;
	@try {
		wrapperObject = [[OGTKFilterListModel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFilterListModel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FILTER_LIST_MODEL, GtkFilterListModel);
}

- (OGTKFilter*)filter
{
	GtkFilter* gobjectValue = gtk_filter_list_model_get_filter((GtkFilterListModel*)[self castedGObject]);

	OGTKFilter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)incremental
{
	bool returnValue = (bool)gtk_filter_list_model_get_incremental((GtkFilterListModel*)[self castedGObject]);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_filter_list_model_get_model((GtkFilterListModel*)[self castedGObject]);

	return returnValue;
}

- (guint)pending
{
	guint returnValue = (guint)gtk_filter_list_model_get_pending((GtkFilterListModel*)[self castedGObject]);

	return returnValue;
}

- (void)setFilter:(OGTKFilter*)filter
{
	gtk_filter_list_model_set_filter((GtkFilterListModel*)[self castedGObject], [filter castedGObject]);
}

- (void)setIncremental:(bool)incremental
{
	gtk_filter_list_model_set_incremental((GtkFilterListModel*)[self castedGObject], incremental);
}

- (void)setModel:(GListModel*)model
{
	gtk_filter_list_model_set_model((GtkFilterListModel*)[self castedGObject], model);
}


@end