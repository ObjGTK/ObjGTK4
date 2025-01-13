/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCheckButton.h"

@implementation OGTKCheckButton

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CHECK_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)checkButton
{
	GtkCheckButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_check_button_new(), GtkCheckButton, GtkCheckButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCheckButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKCheckButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)checkButtonWithLabel:(OFString*)label
{
	GtkCheckButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_check_button_new_with_label([label UTF8String]), GtkCheckButton, GtkCheckButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCheckButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKCheckButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)checkButtonWithMnemonicWithLabel:(OFString*)label
{
	GtkCheckButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_check_button_new_with_mnemonic([label UTF8String]), GtkCheckButton, GtkCheckButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCheckButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKCheckButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCheckButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCheckButton, GtkCheckButton);
}

- (bool)active
{
	bool returnValue = (bool)gtk_check_button_get_active([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_check_button_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)inconsistent
{
	bool returnValue = (bool)gtk_check_button_get_inconsistent([self castedGObject]);

	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_check_button_get_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = (bool)gtk_check_button_get_use_underline([self castedGObject]);

	return returnValue;
}

- (void)setActiveWithSetting:(bool)setting
{
	gtk_check_button_set_active([self castedGObject], setting);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_check_button_set_child([self castedGObject], [child castedGObject]);
}

- (void)setGroup:(OGTKCheckButton*)group
{
	gtk_check_button_set_group([self castedGObject], [group castedGObject]);
}

- (void)setInconsistent:(bool)inconsistent
{
	gtk_check_button_set_inconsistent([self castedGObject], inconsistent);
}

- (void)setLabel:(OFString*)label
{
	gtk_check_button_set_label([self castedGObject], [label UTF8String]);
}

- (void)setUseUnderlineWithSetting:(bool)setting
{
	gtk_check_button_set_use_underline([self castedGObject], setting);
}


@end