/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSizeGroup.h"

#import "OGTKWidget.h"

@implementation OGTKSizeGroup

- (instancetype)init:(GtkSizeGroupMode)mode
{
	GtkSizeGroup* gobjectValue = GTK_SIZE_GROUP(gtk_size_group_new(mode));

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

- (GtkSizeGroup*)castedGObject
{
	return GTK_SIZE_GROUP([self gObject]);
}

- (void)addWidget:(OGTKWidget*)widget
{
	gtk_size_group_add_widget([self castedGObject], [widget castedGObject]);
}

- (GtkSizeGroupMode)mode
{
	GtkSizeGroupMode returnValue = gtk_size_group_get_mode([self castedGObject]);

	return returnValue;
}

- (GSList*)widgets
{
	GSList* returnValue = gtk_size_group_get_widgets([self castedGObject]);

	return returnValue;
}

- (void)removeWidget:(OGTKWidget*)widget
{
	gtk_size_group_remove_widget([self castedGObject], [widget castedGObject]);
}

- (void)setMode:(GtkSizeGroupMode)mode
{
	gtk_size_group_set_mode([self castedGObject], mode);
}


@end