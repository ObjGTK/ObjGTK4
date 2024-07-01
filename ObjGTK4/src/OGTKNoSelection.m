/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNoSelection.h"

@implementation OGTKNoSelection

- (instancetype)init:(GListModel*)model
{
	GtkNoSelection* gobjectValue = GTK_NO_SELECTION(gtk_no_selection_new(model));

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

- (GtkNoSelection*)castedGObject
{
	return GTK_NO_SELECTION([self gObject]);
}

- (GListModel*)model
{
	GListModel* returnValue = gtk_no_selection_get_model([self castedGObject]);

	return returnValue;
}

- (void)setModel:(GListModel*)model
{
	gtk_no_selection_set_model([self castedGObject], model);
}


@end