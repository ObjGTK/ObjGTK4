/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPadController.h"

#import <OGdk4/OGdkDevice.h>

@implementation OGTKPadController

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PAD_CONTROLLER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_PAD_CONTROLLER);
	return gObjectClass;
}

+ (instancetype)padControllerWithGroup:(GActionGroup*)group pad:(OGdkDevice*)pad
{
	GtkPadController* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_pad_controller_new(group, [pad castedGObject]), GTK_TYPE_PAD_CONTROLLER, GtkPadController);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKPadController* wrapperObject;
	@try {
		wrapperObject = [[OGTKPadController alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPadController*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_PAD_CONTROLLER, GtkPadController);
}

- (void)setActionWithType:(GtkPadActionType)type index:(int)index mode:(int)mode label:(OFString*)label actionName:(OFString*)actionName
{
	gtk_pad_controller_set_action((GtkPadController*)[self castedGObject], type, index, mode, [label UTF8String], [actionName UTF8String]);
}

- (void)setActionEntries:(const GtkPadActionEntry*)entries nentries:(int)nentries
{
	gtk_pad_controller_set_action_entries((GtkPadController*)[self castedGObject], entries, nentries);
}


@end