/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAssistant.h"

#import "OGTKAssistantPage.h"
#import "OGTKWidget.h"

@implementation OGTKAssistant

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ASSISTANT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)assistant
{
	GtkAssistant* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_assistant_new(), GtkAssistant, GtkAssistant);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKAssistant* wrapperObject;
	@try {
		wrapperObject = [[OGTKAssistant alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAssistant*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkAssistant, GtkAssistant);
}

- (void)addActionWidgetWithChild:(OGTKWidget*)child
{
	gtk_assistant_add_action_widget([self castedGObject], [child castedGObject]);
}

- (int)appendPage:(OGTKWidget*)page
{
	int returnValue = (int)gtk_assistant_append_page([self castedGObject], [page castedGObject]);

	return returnValue;
}

- (void)commit
{
	gtk_assistant_commit([self castedGObject]);
}

- (int)currentPage
{
	int returnValue = (int)gtk_assistant_get_current_page([self castedGObject]);

	return returnValue;
}

- (int)npages
{
	int returnValue = (int)gtk_assistant_get_n_pages([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)nthPageWithPageNum:(int)pageNum
{
	GtkWidget* gobjectValue = gtk_assistant_get_nth_page([self castedGObject], pageNum);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKAssistantPage*)pageWithChild:(OGTKWidget*)child
{
	GtkAssistantPage* gobjectValue = gtk_assistant_get_page([self castedGObject], [child castedGObject]);

	OGTKAssistantPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)pageCompleteWithPage:(OGTKWidget*)page
{
	bool returnValue = (bool)gtk_assistant_get_page_complete([self castedGObject], [page castedGObject]);

	return returnValue;
}

- (OFString*)pageTitleWithPage:(OGTKWidget*)page
{
	const char* gobjectValue = gtk_assistant_get_page_title([self castedGObject], [page castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkAssistantPageType)pageTypeWithPage:(OGTKWidget*)page
{
	GtkAssistantPageType returnValue = (GtkAssistantPageType)gtk_assistant_get_page_type([self castedGObject], [page castedGObject]);

	return returnValue;
}

- (GListModel*)pages
{
	GListModel* returnValue = (GListModel*)gtk_assistant_get_pages([self castedGObject]);

	return returnValue;
}

- (int)insertPage:(OGTKWidget*)page position:(int)position
{
	int returnValue = (int)gtk_assistant_insert_page([self castedGObject], [page castedGObject], position);

	return returnValue;
}

- (void)nextPage
{
	gtk_assistant_next_page([self castedGObject]);
}

- (int)prependPage:(OGTKWidget*)page
{
	int returnValue = (int)gtk_assistant_prepend_page([self castedGObject], [page castedGObject]);

	return returnValue;
}

- (void)previousPage
{
	gtk_assistant_previous_page([self castedGObject]);
}

- (void)removeActionWidgetWithChild:(OGTKWidget*)child
{
	gtk_assistant_remove_action_widget([self castedGObject], [child castedGObject]);
}

- (void)removePageWithPageNum:(int)pageNum
{
	gtk_assistant_remove_page([self castedGObject], pageNum);
}

- (void)setCurrentPageWithPageNum:(int)pageNum
{
	gtk_assistant_set_current_page([self castedGObject], pageNum);
}

- (void)setForwardPageFunc:(GtkAssistantPageFunc)pageFunc data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	gtk_assistant_set_forward_page_func([self castedGObject], pageFunc, data, destroy);
}

- (void)setPageComplete:(OGTKWidget*)page complete:(bool)complete
{
	gtk_assistant_set_page_complete([self castedGObject], [page castedGObject], complete);
}

- (void)setPageTitle:(OGTKWidget*)page title:(OFString*)title
{
	gtk_assistant_set_page_title([self castedGObject], [page castedGObject], [title UTF8String]);
}

- (void)setPageType:(OGTKWidget*)page type:(GtkAssistantPageType)type
{
	gtk_assistant_set_page_type([self castedGObject], [page castedGObject], type);
}

- (void)updateButtonsState
{
	gtk_assistant_update_buttons_state([self castedGObject]);
}


@end