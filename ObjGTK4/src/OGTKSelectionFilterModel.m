/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSelectionFilterModel.h"

@implementation OGTKSelectionFilterModel

- (instancetype)init:(GtkSelectionModel*)model
{
	GtkSelectionFilterModel* gobjectValue = GTK_SELECTION_FILTER_MODEL(gtk_selection_filter_model_new(model));

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

- (GtkSelectionFilterModel*)castedGObject
{
	return GTK_SELECTION_FILTER_MODEL([self gObject]);
}

- (GtkSelectionModel*)model
{
	GtkSelectionModel* returnValue = gtk_selection_filter_model_get_model([self castedGObject]);

	return returnValue;
}

- (void)setModel:(GtkSelectionModel*)model
{
	gtk_selection_filter_model_set_model([self castedGObject], model);
}


@end