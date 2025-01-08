/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKButton.h"

@implementation OGTKButton

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_button_new(), GtkButton, GtkButton);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithIconNameFromIconName:(OFString*)iconName
{
	GtkButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_button_new_from_icon_name([iconName UTF8String]), GtkButton, GtkButton);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithLabel:(OFString*)label
{
	GtkButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_button_new_with_label([label UTF8String]), GtkButton, GtkButton);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithLabelWithMnemonic:(OFString*)label
{
	GtkButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_button_new_with_mnemonic([label UTF8String]), GtkButton, GtkButton);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkButton, GtkButton);
}

- (bool)canShrink
{
	bool returnValue = (bool)gtk_button_get_can_shrink([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_button_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hasFrame
{
	bool returnValue = (bool)gtk_button_get_has_frame([self castedGObject]);

	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_button_get_icon_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_button_get_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = (bool)gtk_button_get_use_underline([self castedGObject]);

	return returnValue;
}

- (void)setCanShrink:(bool)canShrink
{
	gtk_button_set_can_shrink([self castedGObject], canShrink);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_button_set_child([self castedGObject], [child castedGObject]);
}

- (void)setHasFrame:(bool)hasFrame
{
	gtk_button_set_has_frame([self castedGObject], hasFrame);
}

- (void)setIconName:(OFString*)iconName
{
	gtk_button_set_icon_name([self castedGObject], [iconName UTF8String]);
}

- (void)setLabel:(OFString*)label
{
	gtk_button_set_label([self castedGObject], [label UTF8String]);
}

- (void)setUseUnderline:(bool)useUnderline
{
	gtk_button_set_use_underline([self castedGObject], useUnderline);
}


@end