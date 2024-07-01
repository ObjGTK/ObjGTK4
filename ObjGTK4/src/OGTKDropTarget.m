/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDropTarget.h"

#import <OGdk4/OGGdkDrop.h>

@implementation OGTKDropTarget

- (instancetype)initWithType:(GType)type actions:(GdkDragAction)actions
{
	GtkDropTarget* gobjectValue = GTK_DROP_TARGET(gtk_drop_target_new(type, actions));

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

- (GtkDropTarget*)castedGObject
{
	return GTK_DROP_TARGET([self gObject]);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = gtk_drop_target_get_actions([self castedGObject]);

	return returnValue;
}

- (OGGdkDrop*)currentDrop
{
	GdkDrop* gobjectValue = GDK_DROP(gtk_drop_target_get_current_drop([self castedGObject]));

	OGGdkDrop* returnValue = [OGGdkDrop withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkDrop*)drop
{
	GdkDrop* gobjectValue = GDK_DROP(gtk_drop_target_get_drop([self castedGObject]));

	OGGdkDrop* returnValue = [OGGdkDrop withGObject:gobjectValue];
	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = gtk_drop_target_get_formats([self castedGObject]);

	return returnValue;
}

- (const GType*)gtypes:(gsize*)ntypes
{
	const GType* returnValue = gtk_drop_target_get_gtypes([self castedGObject], ntypes);

	return returnValue;
}

- (bool)preload
{
	bool returnValue = gtk_drop_target_get_preload([self castedGObject]);

	return returnValue;
}

- (const GValue*)value
{
	const GValue* returnValue = gtk_drop_target_get_value([self castedGObject]);

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