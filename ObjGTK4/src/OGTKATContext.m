/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKATContext.h"

#import <OGdk4/OGGdkDisplay.h>

@implementation OGTKATContext

- (instancetype)initCreateWithAccessibleRole:(GtkAccessibleRole)accessibleRole accessible:(GtkAccessible*)accessible display:(OGGdkDisplay*)display
{
	GtkATContext* gobjectValue = GTK_AT_CONTEXT(gtk_at_context_create(accessibleRole, accessible, [display castedGObject]));

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

- (GtkATContext*)castedGObject
{
	return GTK_AT_CONTEXT([self gObject]);
}

- (GtkAccessible*)accessible
{
	GtkAccessible* returnValue = gtk_at_context_get_accessible([self castedGObject]);

	return returnValue;
}

- (GtkAccessibleRole)accessibleRole
{
	GtkAccessibleRole returnValue = gtk_at_context_get_accessible_role([self castedGObject]);

	return returnValue;
}


@end