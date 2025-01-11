/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKExpander.h"

@implementation OGTKExpander

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EXPANDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)expander:(OFString*)label
{
	GtkExpander* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_expander_new([label UTF8String]), GtkExpander, GtkExpander);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKExpander* wrapperObject;
	@try {
		wrapperObject = [[OGTKExpander alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)expanderWithMnemonic:(OFString*)label
{
	GtkExpander* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_expander_new_with_mnemonic([label UTF8String]), GtkExpander, GtkExpander);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKExpander* wrapperObject;
	@try {
		wrapperObject = [[OGTKExpander alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkExpander*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkExpander, GtkExpander);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_expander_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)expanded
{
	bool returnValue = (bool)gtk_expander_get_expanded([self castedGObject]);

	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_expander_get_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)labelWidget
{
	GtkWidget* gobjectValue = gtk_expander_get_label_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)resizeToplevel
{
	bool returnValue = (bool)gtk_expander_get_resize_toplevel([self castedGObject]);

	return returnValue;
}

- (bool)useMarkup
{
	bool returnValue = (bool)gtk_expander_get_use_markup([self castedGObject]);

	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = (bool)gtk_expander_get_use_underline([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_expander_set_child([self castedGObject], [child castedGObject]);
}

- (void)setExpanded:(bool)expanded
{
	gtk_expander_set_expanded([self castedGObject], expanded);
}

- (void)setLabel:(OFString*)label
{
	gtk_expander_set_label([self castedGObject], [label UTF8String]);
}

- (void)setLabelWidget:(OGTKWidget*)labelWidget
{
	gtk_expander_set_label_widget([self castedGObject], [labelWidget castedGObject]);
}

- (void)setResizeToplevel:(bool)resizeToplevel
{
	gtk_expander_set_resize_toplevel([self castedGObject], resizeToplevel);
}

- (void)setUseMarkup:(bool)useMarkup
{
	gtk_expander_set_use_markup([self castedGObject], useMarkup);
}

- (void)setUseUnderline:(bool)useUnderline
{
	gtk_expander_set_use_underline([self castedGObject], useUnderline);
}


@end