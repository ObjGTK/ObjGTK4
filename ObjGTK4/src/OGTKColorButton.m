/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColorButton.h"

@implementation OGTKColorButton

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COLOR_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_COLOR_BUTTON);
	return gObjectClass;
}

+ (instancetype)colorButton
{
	GtkColorButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_color_button_new(), GTK_TYPE_COLOR_BUTTON, GtkColorButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKColorButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKColorButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)colorButtonWithRgba:(const GdkRGBA*)rgba
{
	GtkColorButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_color_button_new_with_rgba(rgba), GTK_TYPE_COLOR_BUTTON, GtkColorButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKColorButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKColorButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkColorButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_COLOR_BUTTON, GtkColorButton);
}

- (bool)modal
{
	bool returnValue = (bool)gtk_color_button_get_modal((GtkColorButton*)[self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_color_button_get_title((GtkColorButton*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setModal:(bool)modal
{
	gtk_color_button_set_modal((GtkColorButton*)[self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_color_button_set_title((GtkColorButton*)[self castedGObject], [title UTF8String]);
}


@end