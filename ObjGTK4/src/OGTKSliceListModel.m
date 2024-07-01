/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSliceListModel.h"

@implementation OGTKSliceListModel

- (instancetype)initWithModel:(GListModel*)model offset:(guint)offset size:(guint)size
{
	GtkSliceListModel* gobjectValue = GTK_SLICE_LIST_MODEL(gtk_slice_list_model_new(model, offset, size));

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

- (GtkSliceListModel*)castedGObject
{
	return GTK_SLICE_LIST_MODEL([self gObject]);
}

- (GListModel*)model
{
	GListModel* returnValue = gtk_slice_list_model_get_model([self castedGObject]);

	return returnValue;
}

- (guint)offset
{
	guint returnValue = gtk_slice_list_model_get_offset([self castedGObject]);

	return returnValue;
}

- (guint)size
{
	guint returnValue = gtk_slice_list_model_get_size([self castedGObject]);

	return returnValue;
}

- (void)setModel:(GListModel*)model
{
	gtk_slice_list_model_set_model([self castedGObject], model);
}

- (void)setOffset:(guint)offset
{
	gtk_slice_list_model_set_offset([self castedGObject], offset);
}

- (void)setSize:(guint)size
{
	gtk_slice_list_model_set_size([self castedGObject], size);
}


@end