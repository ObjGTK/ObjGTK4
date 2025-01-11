/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAppChooserDialog.h"

#import "OGTKWidget.h"
#import "OGTKWindow.h"

@implementation OGTKAppChooserDialog

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_APP_CHOOSER_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)appChooserDialogWithParent:(OGTKWindow*)parent flags:(GtkDialogFlags)flags file:(GFile*)file
{
	GtkAppChooserDialog* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_app_chooser_dialog_new([parent castedGObject], flags, file), GtkAppChooserDialog, GtkAppChooserDialog);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKAppChooserDialog* wrapperObject;
	@try {
		wrapperObject = [[OGTKAppChooserDialog alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)appChooserDialogForContentTypeWithParent:(OGTKWindow*)parent flags:(GtkDialogFlags)flags contentType:(OFString*)contentType
{
	GtkAppChooserDialog* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_app_chooser_dialog_new_for_content_type([parent castedGObject], flags, [contentType UTF8String]), GtkAppChooserDialog, GtkAppChooserDialog);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKAppChooserDialog* wrapperObject;
	@try {
		wrapperObject = [[OGTKAppChooserDialog alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAppChooserDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkAppChooserDialog, GtkAppChooserDialog);
}

- (OFString*)heading
{
	const char* gobjectValue = gtk_app_chooser_dialog_get_heading([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = gtk_app_chooser_dialog_get_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setHeading:(OFString*)heading
{
	gtk_app_chooser_dialog_set_heading([self castedGObject], [heading UTF8String]);
}


@end