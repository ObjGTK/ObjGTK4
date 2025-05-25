/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMultiSelection.h"

@implementation OGTKMultiSelection

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MULTI_SELECTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_MULTI_SELECTION);
	return gObjectClass;
}

+ (instancetype)multiSelectionWithModel:(GListModel*)model
{
	GtkMultiSelection* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_multi_selection_new(model), GTK_TYPE_MULTI_SELECTION, GtkMultiSelection);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKMultiSelection* wrapperObject;
	@try {
		wrapperObject = [[OGTKMultiSelection alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkMultiSelection*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_MULTI_SELECTION, GtkMultiSelection);
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_multi_selection_get_model((GtkMultiSelection*)[self castedGObject]);

	return returnValue;
}

- (void)setModel:(GListModel*)model
{
	gtk_multi_selection_set_model((GtkMultiSelection*)[self castedGObject], model);
}


@end