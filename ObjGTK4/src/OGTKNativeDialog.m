/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNativeDialog.h"

#import "OGTKWindow.h"

@implementation OGTKNativeDialog

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_NATIVE_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkNativeDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkNativeDialog, GtkNativeDialog);
}

- (void)destroy
{
	gtk_native_dialog_destroy([self castedGObject]);
}

- (bool)modal
{
	bool returnValue = (bool)gtk_native_dialog_get_modal([self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_native_dialog_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWindow*)transientFor
{
	GtkWindow* gobjectValue = gtk_native_dialog_get_transient_for([self castedGObject]);

	OGTKWindow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)visible
{
	bool returnValue = (bool)gtk_native_dialog_get_visible([self castedGObject]);

	return returnValue;
}

- (void)hide
{
	gtk_native_dialog_hide([self castedGObject]);
}

- (void)setModal:(bool)modal
{
	gtk_native_dialog_set_modal([self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_native_dialog_set_title([self castedGObject], [title UTF8String]);
}

- (void)setTransientForWithParent:(OGTKWindow*)parent
{
	gtk_native_dialog_set_transient_for([self castedGObject], [parent castedGObject]);
}

- (void)show
{
	gtk_native_dialog_show([self castedGObject]);
}


@end