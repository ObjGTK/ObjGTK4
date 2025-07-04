/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColorDialogButton.h"

#import "OGTKColorDialog.h"

@implementation OGTKColorDialogButton

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COLOR_DIALOG_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_COLOR_DIALOG_BUTTON);
	return gObjectClass;
}

+ (instancetype)colorDialogButtonWithDialog:(OGTKColorDialog*)dialog
{
	GtkColorDialogButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_color_dialog_button_new([dialog castedGObject]), GTK_TYPE_COLOR_DIALOG_BUTTON, GtkColorDialogButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKColorDialogButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKColorDialogButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkColorDialogButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_COLOR_DIALOG_BUTTON, GtkColorDialogButton);
}

- (OGTKColorDialog*)dialog
{
	GtkColorDialog* gobjectValue = gtk_color_dialog_button_get_dialog((GtkColorDialogButton*)[self castedGObject]);

	OGTKColorDialog* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (const GdkRGBA*)rgba
{
	const GdkRGBA* returnValue = (const GdkRGBA*)gtk_color_dialog_button_get_rgba((GtkColorDialogButton*)[self castedGObject]);

	return returnValue;
}

- (void)setDialog:(OGTKColorDialog*)dialog
{
	gtk_color_dialog_button_set_dialog((GtkColorDialogButton*)[self castedGObject], [dialog castedGObject]);
}

- (void)setRgbaWithColor:(const GdkRGBA*)color
{
	gtk_color_dialog_button_set_rgba((GtkColorDialogButton*)[self castedGObject], color);
}


@end