/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFontButton.h"

@implementation OGTKFontButton

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FONT_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FONT_BUTTON);
	return gObjectClass;
}

+ (instancetype)fontButton
{
	GtkFontButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_font_button_new(), GTK_TYPE_FONT_BUTTON, GtkFontButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKFontButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKFontButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)fontButtonWithFontWithFontname:(OFString*)fontname
{
	GtkFontButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_font_button_new_with_font([fontname UTF8String]), GTK_TYPE_FONT_BUTTON, GtkFontButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKFontButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKFontButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFontButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FONT_BUTTON, GtkFontButton);
}

- (bool)modal
{
	bool returnValue = (bool)gtk_font_button_get_modal((GtkFontButton*)[self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_font_button_get_title((GtkFontButton*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useFont
{
	bool returnValue = (bool)gtk_font_button_get_use_font((GtkFontButton*)[self castedGObject]);

	return returnValue;
}

- (bool)useSize
{
	bool returnValue = (bool)gtk_font_button_get_use_size((GtkFontButton*)[self castedGObject]);

	return returnValue;
}

- (void)setModal:(bool)modal
{
	gtk_font_button_set_modal((GtkFontButton*)[self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_font_button_set_title((GtkFontButton*)[self castedGObject], [title UTF8String]);
}

- (void)setUseFont:(bool)useFont
{
	gtk_font_button_set_use_font((GtkFontButton*)[self castedGObject], useFont);
}

- (void)setUseSize:(bool)useSize
{
	gtk_font_button_set_use_size((GtkFontButton*)[self castedGObject], useSize);
}


@end