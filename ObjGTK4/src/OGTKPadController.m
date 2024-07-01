/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPadController.h"

#import <OGdk4/OGGdkDevice.h>

@implementation OGTKPadController

- (instancetype)initWithGroup:(GActionGroup*)group pad:(OGGdkDevice*)pad
{
	GtkPadController* gobjectValue = GTK_PAD_CONTROLLER(gtk_pad_controller_new(group, [pad castedGObject]));

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

- (GtkPadController*)castedGObject
{
	return GTK_PAD_CONTROLLER([self gObject]);
}

- (void)setActionWithType:(GtkPadActionType)type index:(int)index mode:(int)mode label:(OFString*)label actionName:(OFString*)actionName
{
	gtk_pad_controller_set_action([self castedGObject], type, index, mode, [label UTF8String], [actionName UTF8String]);
}

- (void)setActionEntriesWithEntries:(const GtkPadActionEntry*)entries nentries:(int)nentries
{
	gtk_pad_controller_set_action_entries([self castedGObject], entries, nentries);
}


@end