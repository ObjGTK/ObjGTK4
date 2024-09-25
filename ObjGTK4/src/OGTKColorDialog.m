/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColorDialog.h"

#import <OGio/OGCancellable.h>
#import "OGTKWindow.h"

@implementation OGTKColorDialog

- (instancetype)init
{
	GtkColorDialog* gobjectValue = GTK_COLOR_DIALOG(gtk_color_dialog_new());

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

- (GtkColorDialog*)castedGObject
{
	return GTK_COLOR_DIALOG([self gObject]);
}

- (void)chooseRgbaWithParent:(OGTKWindow*)parent initialColor:(const GdkRGBA*)initialColor cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_color_dialog_choose_rgba([self castedGObject], [parent castedGObject], initialColor, [cancellable castedGObject], callback, userData);
}

- (GdkRGBA*)chooseRgbaFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	GdkRGBA* returnValue = gtk_color_dialog_choose_rgba_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)modal
{
	bool returnValue = gtk_color_dialog_get_modal([self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_color_dialog_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)withAlpha
{
	bool returnValue = gtk_color_dialog_get_with_alpha([self castedGObject]);

	return returnValue;
}

- (void)setModal:(bool)modal
{
	gtk_color_dialog_set_modal([self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_color_dialog_set_title([self castedGObject], [title UTF8String]);
}

- (void)setWithAlpha:(bool)withAlpha
{
	gtk_color_dialog_set_with_alpha([self castedGObject], withAlpha);
}


@end