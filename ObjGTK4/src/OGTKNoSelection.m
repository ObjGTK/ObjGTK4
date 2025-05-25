/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNoSelection.h"

@implementation OGTKNoSelection

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_NO_SELECTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_NO_SELECTION);
	return gObjectClass;
}

+ (instancetype)noSelectionWithModel:(GListModel*)model
{
	GtkNoSelection* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_no_selection_new(model), GTK_TYPE_NO_SELECTION, GtkNoSelection);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKNoSelection* wrapperObject;
	@try {
		wrapperObject = [[OGTKNoSelection alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkNoSelection*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_NO_SELECTION, GtkNoSelection);
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_no_selection_get_model((GtkNoSelection*)[self castedGObject]);

	return returnValue;
}

- (void)setModel:(GListModel*)model
{
	gtk_no_selection_set_model((GtkNoSelection*)[self castedGObject], model);
}


@end