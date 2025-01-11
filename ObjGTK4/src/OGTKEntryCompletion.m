/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEntryCompletion.h"

#import "OGTKCellArea.h"
#import "OGTKWidget.h"

@implementation OGTKEntryCompletion

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ENTRY_COMPLETION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)entryCompletion
{
	GtkEntryCompletion* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_entry_completion_new(), GtkEntryCompletion, GtkEntryCompletion);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKEntryCompletion* wrapperObject;
	@try {
		wrapperObject = [[OGTKEntryCompletion alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)entryCompletionWithArea:(OGTKCellArea*)area
{
	GtkEntryCompletion* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_entry_completion_new_with_area([area castedGObject]), GtkEntryCompletion, GtkEntryCompletion);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKEntryCompletion* wrapperObject;
	@try {
		wrapperObject = [[OGTKEntryCompletion alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkEntryCompletion*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkEntryCompletion, GtkEntryCompletion);
}

- (void)complete
{
	gtk_entry_completion_complete([self castedGObject]);
}

- (char*)computePrefix:(OFString*)key
{
	char* gobjectValue = gtk_entry_completion_compute_prefix([self castedGObject], [key UTF8String]);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (OFString*)completionPrefix
{
	const char* gobjectValue = gtk_entry_completion_get_completion_prefix([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)entry
{
	GtkWidget* gobjectValue = gtk_entry_completion_get_entry([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)inlineCompletion
{
	bool returnValue = (bool)gtk_entry_completion_get_inline_completion([self castedGObject]);

	return returnValue;
}

- (bool)inlineSelection
{
	bool returnValue = (bool)gtk_entry_completion_get_inline_selection([self castedGObject]);

	return returnValue;
}

- (int)minimumKeyLength
{
	int returnValue = (int)gtk_entry_completion_get_minimum_key_length([self castedGObject]);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = (GtkTreeModel*)gtk_entry_completion_get_model([self castedGObject]);

	return returnValue;
}

- (bool)popupCompletion
{
	bool returnValue = (bool)gtk_entry_completion_get_popup_completion([self castedGObject]);

	return returnValue;
}

- (bool)popupSetWidth
{
	bool returnValue = (bool)gtk_entry_completion_get_popup_set_width([self castedGObject]);

	return returnValue;
}

- (bool)popupSingleMatch
{
	bool returnValue = (bool)gtk_entry_completion_get_popup_single_match([self castedGObject]);

	return returnValue;
}

- (int)textColumn
{
	int returnValue = (int)gtk_entry_completion_get_text_column([self castedGObject]);

	return returnValue;
}

- (void)insertPrefix
{
	gtk_entry_completion_insert_prefix([self castedGObject]);
}

- (void)setInlineCompletion:(bool)inlineCompletion
{
	gtk_entry_completion_set_inline_completion([self castedGObject], inlineCompletion);
}

- (void)setInlineSelection:(bool)inlineSelection
{
	gtk_entry_completion_set_inline_selection([self castedGObject], inlineSelection);
}

- (void)setMatchFuncWithFunc:(GtkEntryCompletionMatchFunc)func funcData:(gpointer)funcData funcNotify:(GDestroyNotify)funcNotify
{
	gtk_entry_completion_set_match_func([self castedGObject], func, funcData, funcNotify);
}

- (void)setMinimumKeyLength:(int)length
{
	gtk_entry_completion_set_minimum_key_length([self castedGObject], length);
}

- (void)setModel:(GtkTreeModel*)model
{
	gtk_entry_completion_set_model([self castedGObject], model);
}

- (void)setPopupCompletion:(bool)popupCompletion
{
	gtk_entry_completion_set_popup_completion([self castedGObject], popupCompletion);
}

- (void)setPopupSetWidth:(bool)popupSetWidth
{
	gtk_entry_completion_set_popup_set_width([self castedGObject], popupSetWidth);
}

- (void)setPopupSingleMatch:(bool)popupSingleMatch
{
	gtk_entry_completion_set_popup_single_match([self castedGObject], popupSingleMatch);
}

- (void)setTextColumn:(int)column
{
	gtk_entry_completion_set_text_column([self castedGObject], column);
}


@end