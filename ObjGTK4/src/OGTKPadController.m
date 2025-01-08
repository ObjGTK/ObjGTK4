/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPadController.h"

#import <OGdk4/OGdkDevice.h>

@implementation OGTKPadController

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PAD_CONTROLLER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithGroup:(GActionGroup*)group pad:(OGdkDevice*)pad
{
	GtkPadController* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_pad_controller_new(group, [pad castedGObject]), GtkPadController, GtkPadController);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkPadController, GtkPadController);
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