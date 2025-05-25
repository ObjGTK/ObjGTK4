/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSpinner.h"

@implementation OGTKSpinner

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SPINNER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SPINNER);
	return gObjectClass;
}

+ (instancetype)spinner
{
	GtkSpinner* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_spinner_new(), GTK_TYPE_SPINNER, GtkSpinner);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKSpinner* wrapperObject;
	@try {
		wrapperObject = [[OGTKSpinner alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSpinner*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SPINNER, GtkSpinner);
}

- (bool)spinning
{
	bool returnValue = (bool)gtk_spinner_get_spinning((GtkSpinner*)[self castedGObject]);

	return returnValue;
}

- (void)setSpinning:(bool)spinning
{
	gtk_spinner_set_spinning((GtkSpinner*)[self castedGObject], spinning);
}

- (void)start
{
	gtk_spinner_start((GtkSpinner*)[self castedGObject]);
}

- (void)stop
{
	gtk_spinner_stop((GtkSpinner*)[self castedGObject]);
}


@end