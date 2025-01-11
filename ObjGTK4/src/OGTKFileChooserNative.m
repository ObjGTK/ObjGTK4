/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFileChooserNative.h"

#import "OGTKWindow.h"

@implementation OGTKFileChooserNative

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FILE_CHOOSER_NATIVE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)fileChooserNativeWithTitle:(OFString*)title parent:(OGTKWindow*)parent action:(GtkFileChooserAction)action acceptLabel:(OFString*)acceptLabel cancelLabel:(OFString*)cancelLabel
{
	GtkFileChooserNative* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_file_chooser_native_new([title UTF8String], [parent castedGObject], action, [acceptLabel UTF8String], [cancelLabel UTF8String]), GtkFileChooserNative, GtkFileChooserNative);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKFileChooserNative* wrapperObject;
	@try {
		wrapperObject = [[OGTKFileChooserNative alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFileChooserNative*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkFileChooserNative, GtkFileChooserNative);
}

- (OFString*)acceptLabel
{
	const char* gobjectValue = gtk_file_chooser_native_get_accept_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)cancelLabel
{
	const char* gobjectValue = gtk_file_chooser_native_get_cancel_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setAcceptLabel:(OFString*)acceptLabel
{
	gtk_file_chooser_native_set_accept_label([self castedGObject], [acceptLabel UTF8String]);
}

- (void)setCancelLabel:(OFString*)cancelLabel
{
	gtk_file_chooser_native_set_cancel_label([self castedGObject], [cancelLabel UTF8String]);
}


@end