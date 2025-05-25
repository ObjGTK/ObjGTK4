/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSliceListModel.h"

@implementation OGTKSliceListModel

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SLICE_LIST_MODEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SLICE_LIST_MODEL);
	return gObjectClass;
}

+ (instancetype)sliceListModelWithModel:(GListModel*)model offset:(guint)offset size:(guint)size
{
	GtkSliceListModel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_slice_list_model_new(model, offset, size), GTK_TYPE_SLICE_LIST_MODEL, GtkSliceListModel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKSliceListModel* wrapperObject;
	@try {
		wrapperObject = [[OGTKSliceListModel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSliceListModel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SLICE_LIST_MODEL, GtkSliceListModel);
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_slice_list_model_get_model((GtkSliceListModel*)[self castedGObject]);

	return returnValue;
}

- (guint)offset
{
	guint returnValue = (guint)gtk_slice_list_model_get_offset((GtkSliceListModel*)[self castedGObject]);

	return returnValue;
}

- (guint)size
{
	guint returnValue = (guint)gtk_slice_list_model_get_size((GtkSliceListModel*)[self castedGObject]);

	return returnValue;
}

- (void)setModel:(GListModel*)model
{
	gtk_slice_list_model_set_model((GtkSliceListModel*)[self castedGObject], model);
}

- (void)setOffset:(guint)offset
{
	gtk_slice_list_model_set_offset((GtkSliceListModel*)[self castedGObject], offset);
}

- (void)setSize:(guint)size
{
	gtk_slice_list_model_set_size((GtkSliceListModel*)[self castedGObject], size);
}


@end