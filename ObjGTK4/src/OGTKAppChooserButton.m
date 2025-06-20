/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAppChooserButton.h"

@implementation OGTKAppChooserButton

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_APP_CHOOSER_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_APP_CHOOSER_BUTTON);
	return gObjectClass;
}

+ (instancetype)appChooserButtonWithContentType:(OFString*)contentType
{
	GtkAppChooserButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_app_chooser_button_new([contentType UTF8String]), GTK_TYPE_APP_CHOOSER_BUTTON, GtkAppChooserButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKAppChooserButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKAppChooserButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAppChooserButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_APP_CHOOSER_BUTTON, GtkAppChooserButton);
}

- (void)appendCustomItemWithName:(OFString*)name label:(OFString*)label icon:(GIcon*)icon
{
	gtk_app_chooser_button_append_custom_item((GtkAppChooserButton*)[self castedGObject], [name UTF8String], [label UTF8String], icon);
}

- (void)appendSeparator
{
	gtk_app_chooser_button_append_separator((GtkAppChooserButton*)[self castedGObject]);
}

- (OFString*)heading
{
	const char* gobjectValue = gtk_app_chooser_button_get_heading((GtkAppChooserButton*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)modal
{
	bool returnValue = (bool)gtk_app_chooser_button_get_modal((GtkAppChooserButton*)[self castedGObject]);

	return returnValue;
}

- (bool)showDefaultItem
{
	bool returnValue = (bool)gtk_app_chooser_button_get_show_default_item((GtkAppChooserButton*)[self castedGObject]);

	return returnValue;
}

- (bool)showDialogItem
{
	bool returnValue = (bool)gtk_app_chooser_button_get_show_dialog_item((GtkAppChooserButton*)[self castedGObject]);

	return returnValue;
}

- (void)setActiveCustomItemWithName:(OFString*)name
{
	gtk_app_chooser_button_set_active_custom_item((GtkAppChooserButton*)[self castedGObject], [name UTF8String]);
}

- (void)setHeading:(OFString*)heading
{
	gtk_app_chooser_button_set_heading((GtkAppChooserButton*)[self castedGObject], [heading UTF8String]);
}

- (void)setModal:(bool)modal
{
	gtk_app_chooser_button_set_modal((GtkAppChooserButton*)[self castedGObject], modal);
}

- (void)setShowDefaultItemWithSetting:(bool)setting
{
	gtk_app_chooser_button_set_show_default_item((GtkAppChooserButton*)[self castedGObject], setting);
}

- (void)setShowDialogItemWithSetting:(bool)setting
{
	gtk_app_chooser_button_set_show_dialog_item((GtkAppChooserButton*)[self castedGObject], setting);
}


@end