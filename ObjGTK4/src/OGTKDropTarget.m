/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDropTarget.h"

#import <OGdk4/OGdkDrop.h>

@implementation OGTKDropTarget

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DROP_TARGET;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)dropTargetWithType:(GType)type actions:(GdkDragAction)actions
{
	GtkDropTarget* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_drop_target_new(type, actions), GtkDropTarget, GtkDropTarget);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKDropTarget* wrapperObject;
	@try {
		wrapperObject = [[OGTKDropTarget alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkDropTarget*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkDropTarget, GtkDropTarget);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = (GdkDragAction)gtk_drop_target_get_actions([self castedGObject]);

	return returnValue;
}

- (OGdkDrop*)currentDrop
{
	GdkDrop* gobjectValue = gtk_drop_target_get_current_drop([self castedGObject]);

	OGdkDrop* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDrop*)drop
{
	GdkDrop* gobjectValue = gtk_drop_target_get_drop([self castedGObject]);

	OGdkDrop* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = (GdkContentFormats*)gtk_drop_target_get_formats([self castedGObject]);

	return returnValue;
}

- (const GType*)gtypes:(gsize*)ntypes
{
	const GType* returnValue = (const GType*)gtk_drop_target_get_gtypes([self castedGObject], ntypes);

	return returnValue;
}

- (bool)preload
{
	bool returnValue = (bool)gtk_drop_target_get_preload([self castedGObject]);

	return returnValue;
}

- (const GValue*)value
{
	const GValue* returnValue = (const GValue*)gtk_drop_target_get_value([self castedGObject]);

	return returnValue;
}

- (void)reject
{
	gtk_drop_target_reject([self castedGObject]);
}

- (void)setActions:(GdkDragAction)actions
{
	gtk_drop_target_set_actions([self castedGObject], actions);
}

- (void)setGtypesWithTypes:(GType*)types ntypes:(gsize)ntypes
{
	gtk_drop_target_set_gtypes([self castedGObject], types, ntypes);
}

- (void)setPreload:(bool)preload
{
	gtk_drop_target_set_preload([self castedGObject], preload);
}


@end