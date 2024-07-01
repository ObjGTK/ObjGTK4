/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNotebook.h"

#import "OGTKNotebookPage.h"

@implementation OGTKNotebook

- (instancetype)init
{
	GtkNotebook* gobjectValue = GTK_NOTEBOOK(gtk_notebook_new());

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

- (GtkNotebook*)castedGObject
{
	return GTK_NOTEBOOK([self gObject]);
}

- (int)appendPageWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel
{
	int returnValue = gtk_notebook_append_page([self castedGObject], [child castedGObject], [tabLabel castedGObject]);

	return returnValue;
}

- (int)appendPageMenuWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel menuLabel:(OGTKWidget*)menuLabel
{
	int returnValue = gtk_notebook_append_page_menu([self castedGObject], [child castedGObject], [tabLabel castedGObject], [menuLabel castedGObject]);

	return returnValue;
}

- (void)detachTab:(OGTKWidget*)child
{
	gtk_notebook_detach_tab([self castedGObject], [child castedGObject]);
}

- (OGTKWidget*)actionWidget:(GtkPackType)packType
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_notebook_get_action_widget([self castedGObject], packType));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (int)currentPage
{
	int returnValue = gtk_notebook_get_current_page([self castedGObject]);

	return returnValue;
}

- (OFString*)groupName
{
	const char* gobjectValue = gtk_notebook_get_group_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)menuLabel:(OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_notebook_get_menu_label([self castedGObject], [child castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)menuLabelText:(OGTKWidget*)child
{
	const char* gobjectValue = gtk_notebook_get_menu_label_text([self castedGObject], [child castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)npages
{
	int returnValue = gtk_notebook_get_n_pages([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)nthPage:(int)pageNum
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_notebook_get_nth_page([self castedGObject], pageNum));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKNotebookPage*)page:(OGTKWidget*)child
{
	GtkNotebookPage* gobjectValue = GTK_NOTEBOOK_PAGE(gtk_notebook_get_page([self castedGObject], [child castedGObject]));

	OGTKNotebookPage* returnValue = [OGTKNotebookPage withGObject:gobjectValue];
	return returnValue;
}

- (GListModel*)pages
{
	GListModel* returnValue = gtk_notebook_get_pages([self castedGObject]);

	return returnValue;
}

- (bool)scrollable
{
	bool returnValue = gtk_notebook_get_scrollable([self castedGObject]);

	return returnValue;
}

- (bool)showBorder
{
	bool returnValue = gtk_notebook_get_show_border([self castedGObject]);

	return returnValue;
}

- (bool)showTabs
{
	bool returnValue = gtk_notebook_get_show_tabs([self castedGObject]);

	return returnValue;
}

- (bool)tabDetachable:(OGTKWidget*)child
{
	bool returnValue = gtk_notebook_get_tab_detachable([self castedGObject], [child castedGObject]);

	return returnValue;
}

- (OGTKWidget*)tabLabel:(OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_notebook_get_tab_label([self castedGObject], [child castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)tabLabelText:(OGTKWidget*)child
{
	const char* gobjectValue = gtk_notebook_get_tab_label_text([self castedGObject], [child castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkPositionType)tabPos
{
	GtkPositionType returnValue = gtk_notebook_get_tab_pos([self castedGObject]);

	return returnValue;
}

- (bool)tabReorderable:(OGTKWidget*)child
{
	bool returnValue = gtk_notebook_get_tab_reorderable([self castedGObject], [child castedGObject]);

	return returnValue;
}

- (int)insertPageWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel position:(int)position
{
	int returnValue = gtk_notebook_insert_page([self castedGObject], [child castedGObject], [tabLabel castedGObject], position);

	return returnValue;
}

- (int)insertPageMenuWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel menuLabel:(OGTKWidget*)menuLabel position:(int)position
{
	int returnValue = gtk_notebook_insert_page_menu([self castedGObject], [child castedGObject], [tabLabel castedGObject], [menuLabel castedGObject], position);

	return returnValue;
}

- (void)nextPage
{
	gtk_notebook_next_page([self castedGObject]);
}

- (int)pageNum:(OGTKWidget*)child
{
	int returnValue = gtk_notebook_page_num([self castedGObject], [child castedGObject]);

	return returnValue;
}

- (void)popupDisable
{
	gtk_notebook_popup_disable([self castedGObject]);
}

- (void)popupEnable
{
	gtk_notebook_popup_enable([self castedGObject]);
}

- (int)prependPageWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel
{
	int returnValue = gtk_notebook_prepend_page([self castedGObject], [child castedGObject], [tabLabel castedGObject]);

	return returnValue;
}

- (int)prependPageMenuWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel menuLabel:(OGTKWidget*)menuLabel
{
	int returnValue = gtk_notebook_prepend_page_menu([self castedGObject], [child castedGObject], [tabLabel castedGObject], [menuLabel castedGObject]);

	return returnValue;
}

- (void)prevPage
{
	gtk_notebook_prev_page([self castedGObject]);
}

- (void)removePage:(int)pageNum
{
	gtk_notebook_remove_page([self castedGObject], pageNum);
}

- (void)reorderChildWithChild:(OGTKWidget*)child position:(int)position
{
	gtk_notebook_reorder_child([self castedGObject], [child castedGObject], position);
}

- (void)setActionWidgetWithWidget:(OGTKWidget*)widget packType:(GtkPackType)packType
{
	gtk_notebook_set_action_widget([self castedGObject], [widget castedGObject], packType);
}

- (void)setCurrentPage:(int)pageNum
{
	gtk_notebook_set_current_page([self castedGObject], pageNum);
}

- (void)setGroupName:(OFString*)groupName
{
	gtk_notebook_set_group_name([self castedGObject], [groupName UTF8String]);
}

- (void)setMenuLabelWithChild:(OGTKWidget*)child menuLabel:(OGTKWidget*)menuLabel
{
	gtk_notebook_set_menu_label([self castedGObject], [child castedGObject], [menuLabel castedGObject]);
}

- (void)setMenuLabelTextWithChild:(OGTKWidget*)child menuText:(OFString*)menuText
{
	gtk_notebook_set_menu_label_text([self castedGObject], [child castedGObject], [menuText UTF8String]);
}

- (void)setScrollable:(bool)scrollable
{
	gtk_notebook_set_scrollable([self castedGObject], scrollable);
}

- (void)setShowBorder:(bool)showBorder
{
	gtk_notebook_set_show_border([self castedGObject], showBorder);
}

- (void)setShowTabs:(bool)showTabs
{
	gtk_notebook_set_show_tabs([self castedGObject], showTabs);
}

- (void)setTabDetachableWithChild:(OGTKWidget*)child detachable:(bool)detachable
{
	gtk_notebook_set_tab_detachable([self castedGObject], [child castedGObject], detachable);
}

- (void)setTabLabelWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel
{
	gtk_notebook_set_tab_label([self castedGObject], [child castedGObject], [tabLabel castedGObject]);
}

- (void)setTabLabelTextWithChild:(OGTKWidget*)child tabText:(OFString*)tabText
{
	gtk_notebook_set_tab_label_text([self castedGObject], [child castedGObject], [tabText UTF8String]);
}

- (void)setTabPos:(GtkPositionType)pos
{
	gtk_notebook_set_tab_pos([self castedGObject], pos);
}

- (void)setTabReorderableWithChild:(OGTKWidget*)child reorderable:(bool)reorderable
{
	gtk_notebook_set_tab_reorderable([self castedGObject], [child castedGObject], reorderable);
}


@end