/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMapListModel.h"

@implementation OGTKMapListModel

- (instancetype)initWithModel:(GListModel*)model mapFunc:(GtkMapListModelMapFunc)mapFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	GtkMapListModel* gobjectValue = GTK_MAP_LIST_MODEL(gtk_map_list_model_new(model, mapFunc, userData, userDestroy));

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

- (GtkMapListModel*)castedGObject
{
	return GTK_MAP_LIST_MODEL([self gObject]);
}

- (GListModel*)model
{
	GListModel* returnValue = gtk_map_list_model_get_model([self castedGObject]);

	return returnValue;
}

- (bool)hasMap
{
	bool returnValue = gtk_map_list_model_has_map([self castedGObject]);

	return returnValue;
}

- (void)setMapFuncWithMapFunc:(GtkMapListModelMapFunc)mapFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	gtk_map_list_model_set_map_func([self castedGObject], mapFunc, userData, userDestroy);
}

- (void)setModel:(GListModel*)model
{
	gtk_map_list_model_set_model([self castedGObject], model);
}


@end