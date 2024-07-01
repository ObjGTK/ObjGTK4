/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStackSwitcher.h"

#import "OGTKStack.h"

@implementation OGTKStackSwitcher

- (instancetype)init
{
	GtkStackSwitcher* gobjectValue = GTK_STACK_SWITCHER(gtk_stack_switcher_new());

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

- (GtkStackSwitcher*)castedGObject
{
	return GTK_STACK_SWITCHER([self gObject]);
}

- (OGTKStack*)stack
{
	GtkStack* gobjectValue = GTK_STACK(gtk_stack_switcher_get_stack([self castedGObject]));

	OGTKStack* returnValue = [OGTKStack withGObject:gobjectValue];
	return returnValue;
}

- (void)setStack:(OGTKStack*)stack
{
	gtk_stack_switcher_set_stack([self castedGObject], [stack castedGObject]);
}


@end