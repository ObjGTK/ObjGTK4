/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSelectionFilterModel.h"

@implementation OGTKSelectionFilterModel

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SELECTION_FILTER_MODEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SELECTION_FILTER_MODEL);
	return gObjectClass;
}

+ (instancetype)selectionFilterModelWithModel:(GtkSelectionModel*)model
{
	GtkSelectionFilterModel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_selection_filter_model_new(model), GTK_TYPE_SELECTION_FILTER_MODEL, GtkSelectionFilterModel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKSelectionFilterModel* wrapperObject;
	@try {
		wrapperObject = [[OGTKSelectionFilterModel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSelectionFilterModel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SELECTION_FILTER_MODEL, GtkSelectionFilterModel);
}

- (GtkSelectionModel*)model
{
	GtkSelectionModel* returnValue = (GtkSelectionModel*)gtk_selection_filter_model_get_model((GtkSelectionFilterModel*)[self castedGObject]);

	return returnValue;
}

- (void)setModel:(GtkSelectionModel*)model
{
	gtk_selection_filter_model_set_model((GtkSelectionFilterModel*)[self castedGObject], model);
}


@end