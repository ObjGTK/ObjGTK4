/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEditableLabel.h"

@implementation OGTKEditableLabel

- (instancetype)init:(OFString*)str
{
	GtkEditableLabel* gobjectValue = GTK_EDITABLE_LABEL(gtk_editable_label_new([str UTF8String]));

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

- (GtkEditableLabel*)castedGObject
{
	return GTK_EDITABLE_LABEL([self gObject]);
}

- (bool)editing
{
	bool returnValue = gtk_editable_label_get_editing([self castedGObject]);

	return returnValue;
}

- (void)startEditing
{
	gtk_editable_label_start_editing([self castedGObject]);
}

- (void)stopEditing:(bool)commit
{
	gtk_editable_label_stop_editing([self castedGObject], commit);
}


@end