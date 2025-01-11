/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFlattenListModel.h"

@implementation OGTKFlattenListModel

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FLATTEN_LIST_MODEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)flattenListModel:(GListModel*)model
{
	GtkFlattenListModel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_flatten_list_model_new(model), GtkFlattenListModel, GtkFlattenListModel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKFlattenListModel* wrapperObject;
	@try {
		wrapperObject = [[OGTKFlattenListModel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFlattenListModel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkFlattenListModel, GtkFlattenListModel);
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_flatten_list_model_get_model([self castedGObject]);

	return returnValue;
}

- (GListModel*)modelForItem:(guint)position
{
	GListModel* returnValue = (GListModel*)gtk_flatten_list_model_get_model_for_item([self castedGObject], position);

	return returnValue;
}

- (void)setModel:(GListModel*)model
{
	gtk_flatten_list_model_set_model([self castedGObject], model);
}


@end