/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKButton.h"

@implementation OGTKButton

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_BUTTON);
	return gObjectClass;
}

+ (instancetype)button
{
	GtkButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_button_new(), GTK_TYPE_BUTTON, GtkButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)buttonFromIconName:(OFString*)iconName
{
	GtkButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_button_new_from_icon_name([iconName UTF8String]), GTK_TYPE_BUTTON, GtkButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)buttonWithLabel:(OFString*)label
{
	GtkButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_button_new_with_label([label UTF8String]), GTK_TYPE_BUTTON, GtkButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)buttonWithMnemonicWithLabel:(OFString*)label
{
	GtkButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_button_new_with_mnemonic([label UTF8String]), GTK_TYPE_BUTTON, GtkButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_BUTTON, GtkButton);
}

- (bool)canShrink
{
	bool returnValue = (bool)gtk_button_get_can_shrink((GtkButton*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_button_get_child((GtkButton*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hasFrame
{
	bool returnValue = (bool)gtk_button_get_has_frame((GtkButton*)[self castedGObject]);

	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_button_get_icon_name((GtkButton*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_button_get_label((GtkButton*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = (bool)gtk_button_get_use_underline((GtkButton*)[self castedGObject]);

	return returnValue;
}

- (void)setCanShrink:(bool)canShrink
{
	gtk_button_set_can_shrink((GtkButton*)[self castedGObject], canShrink);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_button_set_child((GtkButton*)[self castedGObject], [child castedGObject]);
}

- (void)setHasFrame:(bool)hasFrame
{
	gtk_button_set_has_frame((GtkButton*)[self castedGObject], hasFrame);
}

- (void)setIconName:(OFString*)iconName
{
	gtk_button_set_icon_name((GtkButton*)[self castedGObject], [iconName UTF8String]);
}

- (void)setLabel:(OFString*)label
{
	gtk_button_set_label((GtkButton*)[self castedGObject], [label UTF8String]);
}

- (void)setUseUnderline:(bool)useUnderline
{
	gtk_button_set_use_underline((GtkButton*)[self castedGObject], useUnderline);
}


@end