/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLockButton.h"

#import <OGio/OGPermission.h>
#import "OGTKWidget.h"

@implementation OGTKLockButton

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LOCK_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)lockButton:(OGPermission*)permission
{
	GtkLockButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_lock_button_new([permission castedGObject]), GtkLockButton, GtkLockButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKLockButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKLockButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkLockButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkLockButton, GtkLockButton);
}

- (OGPermission*)permission
{
	GPermission* gobjectValue = gtk_lock_button_get_permission([self castedGObject]);

	OGPermission* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setPermission:(OGPermission*)permission
{
	gtk_lock_button_set_permission([self castedGObject], [permission castedGObject]);
}


@end