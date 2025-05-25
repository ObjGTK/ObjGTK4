/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMapListModel.h"

@implementation OGTKMapListModel

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MAP_LIST_MODEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_MAP_LIST_MODEL);
	return gObjectClass;
}

+ (instancetype)mapListModelWithModel:(GListModel*)model mapFunc:(GtkMapListModelMapFunc)mapFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	GtkMapListModel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_map_list_model_new(model, mapFunc, userData, userDestroy), GTK_TYPE_MAP_LIST_MODEL, GtkMapListModel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKMapListModel* wrapperObject;
	@try {
		wrapperObject = [[OGTKMapListModel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkMapListModel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_MAP_LIST_MODEL, GtkMapListModel);
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_map_list_model_get_model((GtkMapListModel*)[self castedGObject]);

	return returnValue;
}

- (bool)hasMap
{
	bool returnValue = (bool)gtk_map_list_model_has_map((GtkMapListModel*)[self castedGObject]);

	return returnValue;
}

- (void)setMapFunc:(GtkMapListModelMapFunc)mapFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	gtk_map_list_model_set_map_func((GtkMapListModel*)[self castedGObject], mapFunc, userData, userDestroy);
}

- (void)setModel:(GListModel*)model
{
	gtk_map_list_model_set_model((GtkMapListModel*)[self castedGObject], model);
}


@end