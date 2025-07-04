/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSizeGroup.h"

#import "OGTKWidget.h"

@implementation OGTKSizeGroup

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SIZE_GROUP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SIZE_GROUP);
	return gObjectClass;
}

+ (instancetype)sizeGroupWithMode:(GtkSizeGroupMode)mode
{
	GtkSizeGroup* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_size_group_new(mode), GTK_TYPE_SIZE_GROUP, GtkSizeGroup);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKSizeGroup* wrapperObject;
	@try {
		wrapperObject = [[OGTKSizeGroup alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSizeGroup*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SIZE_GROUP, GtkSizeGroup);
}

- (void)addWidget:(OGTKWidget*)widget
{
	gtk_size_group_add_widget((GtkSizeGroup*)[self castedGObject], [widget castedGObject]);
}

- (GtkSizeGroupMode)mode
{
	GtkSizeGroupMode returnValue = (GtkSizeGroupMode)gtk_size_group_get_mode((GtkSizeGroup*)[self castedGObject]);

	return returnValue;
}

- (GSList*)widgets
{
	GSList* returnValue = (GSList*)gtk_size_group_get_widgets((GtkSizeGroup*)[self castedGObject]);

	return returnValue;
}

- (void)removeWidget:(OGTKWidget*)widget
{
	gtk_size_group_remove_widget((GtkSizeGroup*)[self castedGObject], [widget castedGObject]);
}

- (void)setMode:(GtkSizeGroupMode)mode
{
	gtk_size_group_set_mode((GtkSizeGroup*)[self castedGObject], mode);
}


@end