/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNativeDialog.h"

#import "OGTKWindow.h"

@implementation OGTKNativeDialog

- (GtkNativeDialog*)castedGObject
{
	return GTK_NATIVE_DIALOG([self gObject]);
}

- (void)destroy
{
	gtk_native_dialog_destroy([self castedGObject]);
}

- (bool)modal
{
	bool returnValue = gtk_native_dialog_get_modal([self castedGObject]);

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
	GtkWindow* gobjectValue = GTK_WINDOW(gtk_native_dialog_get_transient_for([self castedGObject]));

	OGTKWindow* returnValue = [OGTKWindow withGObject:gobjectValue];
	return returnValue;
}

- (bool)visible
{
	bool returnValue = gtk_native_dialog_get_visible([self castedGObject]);

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

- (void)setTransientFor:(OGTKWindow*)parent
{
	gtk_native_dialog_set_transient_for([self castedGObject], [parent castedGObject]);
}

- (void)show
{
	gtk_native_dialog_show([self castedGObject]);
}


@end