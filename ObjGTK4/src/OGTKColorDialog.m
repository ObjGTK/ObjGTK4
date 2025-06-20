/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColorDialog.h"

#import <OGio/OGCancellable.h>
#import "OGTKWindow.h"

@implementation OGTKColorDialog

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COLOR_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_COLOR_DIALOG);
	return gObjectClass;
}

+ (instancetype)colorDialog
{
	GtkColorDialog* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_color_dialog_new(), GTK_TYPE_COLOR_DIALOG, GtkColorDialog);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKColorDialog* wrapperObject;
	@try {
		wrapperObject = [[OGTKColorDialog alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkColorDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_COLOR_DIALOG, GtkColorDialog);
}

- (void)chooseRgbaWithParent:(OGTKWindow*)parent initialColor:(const GdkRGBA*)initialColor cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_color_dialog_choose_rgba((GtkColorDialog*)[self castedGObject], [parent castedGObject], initialColor, [cancellable castedGObject], callback, userData);
}

- (GdkRGBA*)chooseRgbaFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GdkRGBA* returnValue = (GdkRGBA*)gtk_color_dialog_choose_rgba_finish((GtkColorDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)modal
{
	bool returnValue = (bool)gtk_color_dialog_get_modal((GtkColorDialog*)[self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_color_dialog_get_title((GtkColorDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)withAlpha
{
	bool returnValue = (bool)gtk_color_dialog_get_with_alpha((GtkColorDialog*)[self castedGObject]);

	return returnValue;
}

- (void)setModal:(bool)modal
{
	gtk_color_dialog_set_modal((GtkColorDialog*)[self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_color_dialog_set_title((GtkColorDialog*)[self castedGObject], [title UTF8String]);
}

- (void)setWithAlpha:(bool)withAlpha
{
	gtk_color_dialog_set_with_alpha((GtkColorDialog*)[self castedGObject], withAlpha);
}


@end