/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFlattenListModel.h"

@implementation OGTKFlattenListModel

- (instancetype)init:(GListModel*)model
{
	GtkFlattenListModel* gobjectValue = GTK_FLATTEN_LIST_MODEL(gtk_flatten_list_model_new(model));

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

- (GtkFlattenListModel*)castedGObject
{
	return GTK_FLATTEN_LIST_MODEL([self gObject]);
}

- (GListModel*)model
{
	GListModel* returnValue = gtk_flatten_list_model_get_model([self castedGObject]);

	return returnValue;
}

- (GListModel*)modelForItem:(guint)position
{
	GListModel* returnValue = gtk_flatten_list_model_get_model_for_item([self castedGObject], position);

	return returnValue;
}

- (void)setModel:(GListModel*)model
{
	gtk_flatten_list_model_set_model([self castedGObject], model);
}


@end