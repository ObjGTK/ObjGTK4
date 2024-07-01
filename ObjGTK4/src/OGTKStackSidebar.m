/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStackSidebar.h"

#import "OGTKStack.h"

@implementation OGTKStackSidebar

- (instancetype)init
{
	GtkStackSidebar* gobjectValue = GTK_STACK_SIDEBAR(gtk_stack_sidebar_new());

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

- (GtkStackSidebar*)castedGObject
{
	return GTK_STACK_SIDEBAR([self gObject]);
}

- (OGTKStack*)stack
{
	GtkStack* gobjectValue = GTK_STACK(gtk_stack_sidebar_get_stack([self castedGObject]));

	OGTKStack* returnValue = [OGTKStack withGObject:gobjectValue];
	return returnValue;
}

- (void)setStack:(OGTKStack*)stack
{
	gtk_stack_sidebar_set_stack([self castedGObject], [stack castedGObject]);
}


@end