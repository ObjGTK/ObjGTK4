/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFlowBoxChild.h"

@implementation OGTKFlowBoxChild

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FLOW_BOX_CHILD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)flowBoxChild
{
	GtkFlowBoxChild* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_flow_box_child_new(), GtkFlowBoxChild, GtkFlowBoxChild);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKFlowBoxChild* wrapperObject;
	@try {
		wrapperObject = [[OGTKFlowBoxChild alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFlowBoxChild*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkFlowBoxChild, GtkFlowBoxChild);
}

- (void)changed
{
	gtk_flow_box_child_changed([self castedGObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_flow_box_child_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)index
{
	int returnValue = (int)gtk_flow_box_child_get_index([self castedGObject]);

	return returnValue;
}

- (bool)isSelected
{
	bool returnValue = (bool)gtk_flow_box_child_is_selected([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_flow_box_child_set_child([self castedGObject], [child castedGObject]);
}


@end