/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKToggleButton.h"

#import "OGTKWidget.h"

@implementation OGTKToggleButton

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TOGGLE_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)toggleButton
{
	GtkToggleButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_toggle_button_new(), GtkToggleButton, GtkToggleButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKToggleButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKToggleButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)toggleButtonWithLabel:(OFString*)label
{
	GtkToggleButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_toggle_button_new_with_label([label UTF8String]), GtkToggleButton, GtkToggleButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKToggleButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKToggleButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)toggleButtonWithMnemonicWithLabel:(OFString*)label
{
	GtkToggleButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_toggle_button_new_with_mnemonic([label UTF8String]), GtkToggleButton, GtkToggleButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKToggleButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKToggleButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkToggleButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkToggleButton, GtkToggleButton);
}

- (bool)active
{
	bool returnValue = (bool)gtk_toggle_button_get_active([self castedGObject]);

	return returnValue;
}

- (void)setActiveWithIsActive:(bool)isActive
{
	gtk_toggle_button_set_active([self castedGObject], isActive);
}

- (void)setGroup:(OGTKToggleButton*)group
{
	gtk_toggle_button_set_group([self castedGObject], [group castedGObject]);
}

- (void)toggled
{
	gtk_toggle_button_toggled([self castedGObject]);
}


@end