/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

#import <OGdk4/OGdkClipboard.h>
#import <OGdk4/OGdkCursor.h>
#import <OGdk4/OGdkDisplay.h>
#import <OGdk4/OGdkFrameClock.h>
#import "OGTKEventController.h"
#import "OGTKLayoutManager.h"
#import "OGTKSettings.h"
#import "OGTKShortcut.h"
#import "OGTKSnapshot.h"
#import "OGTKStyleContext.h"
#import <OGPango/OGPangoContext.h>
#import <OGPango/OGPangoFontMap.h>
#import <OGPango/OGPangoLayout.h>

@implementation OGTKWidget

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_WIDGET;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_WIDGET);
	return gObjectClass;
}

+ (GtkTextDirection)defaultDirection
{
	GtkTextDirection returnValue = (GtkTextDirection)gtk_widget_get_default_direction();

	return returnValue;
}

+ (void)setDefaultDirection:(GtkTextDirection)dir
{
	gtk_widget_set_default_direction(dir);
}

+ (void)addShortcut:(OGTKShortcut*)shortcut
{
	gtk_widget_class_add_shortcut((GtkWidgetClass*)[self gObjectClass], [shortcut castedGObject]);
}

+ (void)bindTemplateCallbackFullWithCallbackName:(OFString*)callbackName callbackSymbol:(GCallback)callbackSymbol
{
	gtk_widget_class_bind_template_callback_full((GtkWidgetClass*)[self gObjectClass], [callbackName UTF8String], callbackSymbol);
}

+ (void)bindTemplateChildFullWithName:(OFString*)name internalChild:(bool)internalChild structOffset:(gssize)structOffset
{
	gtk_widget_class_bind_template_child_full((GtkWidgetClass*)[self gObjectClass], [name UTF8String], internalChild, structOffset);
}

+ (GtkAccessibleRole)accessibleRole
{
	GtkAccessibleRole returnValue = (GtkAccessibleRole)gtk_widget_class_get_accessible_role((GtkWidgetClass*)[self gObjectClass]);

	return returnValue;
}

+ (guint)activateSignal
{
	guint returnValue = (guint)gtk_widget_class_get_activate_signal((GtkWidgetClass*)[self gObjectClass]);

	return returnValue;
}

+ (OFString*)cssName
{
	const char* gobjectValue = gtk_widget_class_get_css_name((GtkWidgetClass*)[self gObjectClass]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (GType)layoutManagerType
{
	GType returnValue = (GType)gtk_widget_class_get_layout_manager_type((GtkWidgetClass*)[self gObjectClass]);

	return returnValue;
}

+ (void)installActionWithActionName:(OFString*)actionName parameterType:(OFString*)parameterType activate:(GtkWidgetActionActivateFunc)activate
{
	gtk_widget_class_install_action((GtkWidgetClass*)[self gObjectClass], [actionName UTF8String], [parameterType UTF8String], activate);
}

+ (void)installPropertyActionWithActionName:(OFString*)actionName propertyName:(OFString*)propertyName
{
	gtk_widget_class_install_property_action((GtkWidgetClass*)[self gObjectClass], [actionName UTF8String], [propertyName UTF8String]);
}

+ (bool)queryActionWithIndex:(guint)index owner:(GType*)owner actionName:(const char**)actionName parameterType:(const GVariantType**)parameterType propertyName:(const char**)propertyName
{
	bool returnValue = (bool)gtk_widget_class_query_action((GtkWidgetClass*)[self gObjectClass], index, owner, actionName, parameterType, propertyName);

	return returnValue;
}

+ (void)setAccessibleRole:(GtkAccessibleRole)accessibleRole
{
	gtk_widget_class_set_accessible_role((GtkWidgetClass*)[self gObjectClass], accessibleRole);
}

+ (void)setActivateSignalWithSignalId:(guint)signalId
{
	gtk_widget_class_set_activate_signal((GtkWidgetClass*)[self gObjectClass], signalId);
}

+ (void)setActivateSignalFromNameWithSignalName:(OFString*)signalName
{
	gtk_widget_class_set_activate_signal_from_name((GtkWidgetClass*)[self gObjectClass], [signalName UTF8String]);
}

+ (void)setCssName:(OFString*)name
{
	gtk_widget_class_set_css_name((GtkWidgetClass*)[self gObjectClass], [name UTF8String]);
}

+ (void)setLayoutManagerType:(GType)type
{
	gtk_widget_class_set_layout_manager_type((GtkWidgetClass*)[self gObjectClass], type);
}

+ (void)setTemplateWithTemplateBytes:(GBytes*)templateBytes
{
	gtk_widget_class_set_template((GtkWidgetClass*)[self gObjectClass], templateBytes);
}

+ (void)setTemplateFromResourceWithResourceName:(OFString*)resourceName
{
	gtk_widget_class_set_template_from_resource((GtkWidgetClass*)[self gObjectClass], [resourceName UTF8String]);
}

+ (void)setTemplateScope:(GtkBuilderScope*)scope
{
	gtk_widget_class_set_template_scope((GtkWidgetClass*)[self gObjectClass], scope);
}

- (GtkWidget*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_WIDGET, GtkWidget);
}

- (void)actionSetEnabledWithActionName:(OFString*)actionName enabled:(bool)enabled
{
	gtk_widget_action_set_enabled((GtkWidget*)[self castedGObject], [actionName UTF8String], enabled);
}

- (bool)activate
{
	bool returnValue = (bool)gtk_widget_activate((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)activateActionVariantWithName:(OFString*)name args:(GVariant*)args
{
	bool returnValue = (bool)gtk_widget_activate_action_variant((GtkWidget*)[self castedGObject], [name UTF8String], args);

	return returnValue;
}

- (void)activateDefault
{
	gtk_widget_activate_default((GtkWidget*)[self castedGObject]);
}

- (void)addController:(OGTKEventController*)controller
{
	gtk_widget_add_controller((GtkWidget*)[self castedGObject], [controller castedGObject]);
}

- (void)addCssClass:(OFString*)cssClass
{
	gtk_widget_add_css_class((GtkWidget*)[self castedGObject], [cssClass UTF8String]);
}

- (void)addMnemonicLabel:(OGTKWidget*)label
{
	gtk_widget_add_mnemonic_label((GtkWidget*)[self castedGObject], [label castedGObject]);
}

- (guint)addTickCallback:(GtkTickCallback)callback userData:(gpointer)userData notify:(GDestroyNotify)notify
{
	guint returnValue = (guint)gtk_widget_add_tick_callback((GtkWidget*)[self castedGObject], callback, userData, notify);

	return returnValue;
}

- (void)allocateWithWidth:(int)width height:(int)height baseline:(int)baseline transform:(GskTransform*)transform
{
	gtk_widget_allocate((GtkWidget*)[self castedGObject], width, height, baseline, transform);
}

- (bool)childFocusWithDirection:(GtkDirectionType)direction
{
	bool returnValue = (bool)gtk_widget_child_focus((GtkWidget*)[self castedGObject], direction);

	return returnValue;
}

- (bool)computeBoundsWithTarget:(OGTKWidget*)target outBounds:(graphene_rect_t*)outBounds
{
	bool returnValue = (bool)gtk_widget_compute_bounds((GtkWidget*)[self castedGObject], [target castedGObject], outBounds);

	return returnValue;
}

- (bool)computeExpandWithOrientation:(GtkOrientation)orientation
{
	bool returnValue = (bool)gtk_widget_compute_expand((GtkWidget*)[self castedGObject], orientation);

	return returnValue;
}

- (bool)computePointWithTarget:(OGTKWidget*)target point:(const graphene_point_t*)point outPoint:(graphene_point_t*)outPoint
{
	bool returnValue = (bool)gtk_widget_compute_point((GtkWidget*)[self castedGObject], [target castedGObject], point, outPoint);

	return returnValue;
}

- (bool)computeTransformWithTarget:(OGTKWidget*)target outTransform:(graphene_matrix_t*)outTransform
{
	bool returnValue = (bool)gtk_widget_compute_transform((GtkWidget*)[self castedGObject], [target castedGObject], outTransform);

	return returnValue;
}

- (bool)containsWithX:(double)x y:(double)y
{
	bool returnValue = (bool)gtk_widget_contains((GtkWidget*)[self castedGObject], x, y);

	return returnValue;
}

- (OGPangoContext*)createPangoContext
{
	PangoContext* gobjectValue = gtk_widget_create_pango_context((GtkWidget*)[self castedGObject]);

	OGPangoContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoLayout*)createPangoLayoutWithText:(OFString*)text
{
	PangoLayout* gobjectValue = gtk_widget_create_pango_layout((GtkWidget*)[self castedGObject], [text UTF8String]);

	OGPangoLayout* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)disposeTemplateWithWidgetType:(GType)widgetType
{
	gtk_widget_dispose_template((GtkWidget*)[self castedGObject], widgetType);
}

- (bool)dragCheckThresholdWithStartX:(int)startX startY:(int)startY currentX:(int)currentX currentY:(int)currentY
{
	bool returnValue = (bool)gtk_drag_check_threshold((GtkWidget*)[self castedGObject], startX, startY, currentX, currentY);

	return returnValue;
}

- (void)errorBell
{
	gtk_widget_error_bell((GtkWidget*)[self castedGObject]);
}

- (int)allocatedBaseline
{
	int returnValue = (int)gtk_widget_get_allocated_baseline((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (int)allocatedHeight
{
	int returnValue = (int)gtk_widget_get_allocated_height((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (int)allocatedWidth
{
	int returnValue = (int)gtk_widget_get_allocated_width((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (void)allocationWithAllocation:(GtkAllocation*)allocation
{
	gtk_widget_get_allocation((GtkWidget*)[self castedGObject], allocation);
}

- (OGTKWidget*)ancestorWithWidgetType:(GType)widgetType
{
	GtkWidget* gobjectValue = gtk_widget_get_ancestor((GtkWidget*)[self castedGObject], widgetType);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)baseline
{
	int returnValue = (int)gtk_widget_get_baseline((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)canFocus
{
	bool returnValue = (bool)gtk_widget_get_can_focus((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)canTarget
{
	bool returnValue = (bool)gtk_widget_get_can_target((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)childVisible
{
	bool returnValue = (bool)gtk_widget_get_child_visible((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OGdkClipboard*)clipboard
{
	GdkClipboard* gobjectValue = gtk_widget_get_clipboard((GtkWidget*)[self castedGObject]);

	OGdkClipboard* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)colorWithColor:(GdkRGBA*)color
{
	gtk_widget_get_color((GtkWidget*)[self castedGObject], color);
}

- (char**)cssClasses
{
	char** returnValue = (char**)gtk_widget_get_css_classes((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OFString*)cssName
{
	const char* gobjectValue = gtk_widget_get_css_name((GtkWidget*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGdkCursor*)cursor
{
	GdkCursor* gobjectValue = gtk_widget_get_cursor((GtkWidget*)[self castedGObject]);

	OGdkCursor* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkTextDirection)direction
{
	GtkTextDirection returnValue = (GtkTextDirection)gtk_widget_get_direction((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gtk_widget_get_display((GtkWidget*)[self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)firstChild
{
	GtkWidget* gobjectValue = gtk_widget_get_first_child((GtkWidget*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)focusChild
{
	GtkWidget* gobjectValue = gtk_widget_get_focus_child((GtkWidget*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)focusOnClick
{
	bool returnValue = (bool)gtk_widget_get_focus_on_click((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)focusable
{
	bool returnValue = (bool)gtk_widget_get_focusable((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OGPangoFontMap*)fontMap
{
	PangoFontMap* gobjectValue = gtk_widget_get_font_map((GtkWidget*)[self castedGObject]);

	OGPangoFontMap* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (const cairo_font_options_t*)fontOptions
{
	const cairo_font_options_t* returnValue = (const cairo_font_options_t*)gtk_widget_get_font_options((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OGdkFrameClock*)frameClock
{
	GdkFrameClock* gobjectValue = gtk_widget_get_frame_clock((GtkWidget*)[self castedGObject]);

	OGdkFrameClock* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkAlign)halign
{
	GtkAlign returnValue = (GtkAlign)gtk_widget_get_halign((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)hasTooltip
{
	bool returnValue = (bool)gtk_widget_get_has_tooltip((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = (int)gtk_widget_get_height((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)hexpand
{
	bool returnValue = (bool)gtk_widget_get_hexpand((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)hexpandSet
{
	bool returnValue = (bool)gtk_widget_get_hexpand_set((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)lastChild
{
	GtkWidget* gobjectValue = gtk_widget_get_last_child((GtkWidget*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKLayoutManager*)layoutManager
{
	GtkLayoutManager* gobjectValue = gtk_widget_get_layout_manager((GtkWidget*)[self castedGObject]);

	OGTKLayoutManager* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)mapped
{
	bool returnValue = (bool)gtk_widget_get_mapped((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (int)marginBottom
{
	int returnValue = (int)gtk_widget_get_margin_bottom((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (int)marginEnd
{
	int returnValue = (int)gtk_widget_get_margin_end((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (int)marginStart
{
	int returnValue = (int)gtk_widget_get_margin_start((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (int)marginTop
{
	int returnValue = (int)gtk_widget_get_margin_top((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_widget_get_name((GtkWidget*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkNative*)native
{
	GtkNative* returnValue = (GtkNative*)gtk_widget_get_native((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)nextSibling
{
	GtkWidget* gobjectValue = gtk_widget_get_next_sibling((GtkWidget*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (double)opacity
{
	double returnValue = (double)gtk_widget_get_opacity((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (GtkOverflow)overflow
{
	GtkOverflow returnValue = (GtkOverflow)gtk_widget_get_overflow((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OGPangoContext*)pangoContext
{
	PangoContext* gobjectValue = gtk_widget_get_pango_context((GtkWidget*)[self castedGObject]);

	OGPangoContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)parent
{
	GtkWidget* gobjectValue = gtk_widget_get_parent((GtkWidget*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)preferredSizeWithMinimumSize:(GtkRequisition*)minimumSize naturalSize:(GtkRequisition*)naturalSize
{
	gtk_widget_get_preferred_size((GtkWidget*)[self castedGObject], minimumSize, naturalSize);
}

- (OGTKWidget*)prevSibling
{
	GtkWidget* gobjectValue = gtk_widget_get_prev_sibling((GtkWidget*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkClipboard*)primaryClipboard
{
	GdkClipboard* gobjectValue = gtk_widget_get_primary_clipboard((GtkWidget*)[self castedGObject]);

	OGdkClipboard* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)realized
{
	bool returnValue = (bool)gtk_widget_get_realized((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)receivesDefault
{
	bool returnValue = (bool)gtk_widget_get_receives_default((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (GtkSizeRequestMode)requestMode
{
	GtkSizeRequestMode returnValue = (GtkSizeRequestMode)gtk_widget_get_request_mode((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (GtkRoot*)root
{
	GtkRoot* returnValue = (GtkRoot*)gtk_widget_get_root((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (int)scaleFactor
{
	int returnValue = (int)gtk_widget_get_scale_factor((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)sensitive
{
	bool returnValue = (bool)gtk_widget_get_sensitive((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OGTKSettings*)settings
{
	GtkSettings* gobjectValue = gtk_widget_get_settings((GtkWidget*)[self castedGObject]);

	OGTKSettings* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)sizeWithOrientation:(GtkOrientation)orientation
{
	int returnValue = (int)gtk_widget_get_size((GtkWidget*)[self castedGObject], orientation);

	return returnValue;
}

- (void)sizeRequestWithWidth:(int*)width height:(int*)height
{
	gtk_widget_get_size_request((GtkWidget*)[self castedGObject], width, height);
}

- (GtkStateFlags)stateFlags
{
	GtkStateFlags returnValue = (GtkStateFlags)gtk_widget_get_state_flags((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OGTKStyleContext*)styleContext
{
	GtkStyleContext* gobjectValue = gtk_widget_get_style_context((GtkWidget*)[self castedGObject]);

	OGTKStyleContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGObject*)templateChildWithWidgetType:(GType)widgetType name:(OFString*)name
{
	GObject* gobjectValue = gtk_widget_get_template_child((GtkWidget*)[self castedGObject], widgetType, [name UTF8String]);

	OGObject* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)tooltipMarkup
{
	const char* gobjectValue = gtk_widget_get_tooltip_markup((GtkWidget*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)tooltipText
{
	const char* gobjectValue = gtk_widget_get_tooltip_text((GtkWidget*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkAlign)valign
{
	GtkAlign returnValue = (GtkAlign)gtk_widget_get_valign((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)vexpand
{
	bool returnValue = (bool)gtk_widget_get_vexpand((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)vexpandSet
{
	bool returnValue = (bool)gtk_widget_get_vexpand_set((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)visible
{
	bool returnValue = (bool)gtk_widget_get_visible((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = (int)gtk_widget_get_width((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)grabFocus
{
	bool returnValue = (bool)gtk_widget_grab_focus((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)hasCssClass:(OFString*)cssClass
{
	bool returnValue = (bool)gtk_widget_has_css_class((GtkWidget*)[self castedGObject], [cssClass UTF8String]);

	return returnValue;
}

- (bool)hasDefault
{
	bool returnValue = (bool)gtk_widget_has_default((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)hasFocus
{
	bool returnValue = (bool)gtk_widget_has_focus((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)hasVisibleFocus
{
	bool returnValue = (bool)gtk_widget_has_visible_focus((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (void)hide
{
	gtk_widget_hide((GtkWidget*)[self castedGObject]);
}

- (bool)inDestruction
{
	bool returnValue = (bool)gtk_widget_in_destruction((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (void)prepareTemplate
{
	gtk_widget_init_template((GtkWidget*)[self castedGObject]);
}

- (void)insertActionGroupWithName:(OFString*)name group:(GActionGroup*)group
{
	gtk_widget_insert_action_group((GtkWidget*)[self castedGObject], [name UTF8String], group);
}

- (void)insertAfterWithParent:(OGTKWidget*)parent previousSibling:(OGTKWidget*)previousSibling
{
	gtk_widget_insert_after((GtkWidget*)[self castedGObject], [parent castedGObject], [previousSibling castedGObject]);
}

- (void)insertBeforeWithParent:(OGTKWidget*)parent nextSibling:(OGTKWidget*)nextSibling
{
	gtk_widget_insert_before((GtkWidget*)[self castedGObject], [parent castedGObject], [nextSibling castedGObject]);
}

- (bool)isAncestor:(OGTKWidget*)ancestor
{
	bool returnValue = (bool)gtk_widget_is_ancestor((GtkWidget*)[self castedGObject], [ancestor castedGObject]);

	return returnValue;
}

- (bool)isDrawable
{
	bool returnValue = (bool)gtk_widget_is_drawable((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)isFocus
{
	bool returnValue = (bool)gtk_widget_is_focus((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)isSensitive
{
	bool returnValue = (bool)gtk_widget_is_sensitive((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)isVisible
{
	bool returnValue = (bool)gtk_widget_is_visible((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)keynavFailedWithDirection:(GtkDirectionType)direction
{
	bool returnValue = (bool)gtk_widget_keynav_failed((GtkWidget*)[self castedGObject], direction);

	return returnValue;
}

- (GList*)listMnemonicLabels
{
	GList* returnValue = (GList*)gtk_widget_list_mnemonic_labels((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (void)map
{
	gtk_widget_map((GtkWidget*)[self castedGObject]);
}

- (void)measureWithOrientation:(GtkOrientation)orientation forSize:(int)forSize minimum:(int*)minimum natural:(int*)natural minimumBaseline:(int*)minimumBaseline naturalBaseline:(int*)naturalBaseline
{
	gtk_widget_measure((GtkWidget*)[self castedGObject], orientation, forSize, minimum, natural, minimumBaseline, naturalBaseline);
}

- (bool)mnemonicActivateWithGroupCycling:(bool)groupCycling
{
	bool returnValue = (bool)gtk_widget_mnemonic_activate((GtkWidget*)[self castedGObject], groupCycling);

	return returnValue;
}

- (GListModel*)observeChildren
{
	GListModel* returnValue = (GListModel*)gtk_widget_observe_children((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (GListModel*)observeControllers
{
	GListModel* returnValue = (GListModel*)gtk_widget_observe_controllers((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)pickWithX:(double)x y:(double)y flags:(GtkPickFlags)flags
{
	GtkWidget* gobjectValue = gtk_widget_pick((GtkWidget*)[self castedGObject], x, y, flags);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)queueAllocate
{
	gtk_widget_queue_allocate((GtkWidget*)[self castedGObject]);
}

- (void)queueDraw
{
	gtk_widget_queue_draw((GtkWidget*)[self castedGObject]);
}

- (void)queueResize
{
	gtk_widget_queue_resize((GtkWidget*)[self castedGObject]);
}

- (void)realize
{
	gtk_widget_realize((GtkWidget*)[self castedGObject]);
}

- (void)removeController:(OGTKEventController*)controller
{
	gtk_widget_remove_controller((GtkWidget*)[self castedGObject], [controller castedGObject]);
}

- (void)removeCssClass:(OFString*)cssClass
{
	gtk_widget_remove_css_class((GtkWidget*)[self castedGObject], [cssClass UTF8String]);
}

- (void)removeMnemonicLabel:(OGTKWidget*)label
{
	gtk_widget_remove_mnemonic_label((GtkWidget*)[self castedGObject], [label castedGObject]);
}

- (void)removeTickCallbackWithIdentifier:(guint)identifier
{
	gtk_widget_remove_tick_callback((GtkWidget*)[self castedGObject], identifier);
}

- (void)setCanFocus:(bool)canFocus
{
	gtk_widget_set_can_focus((GtkWidget*)[self castedGObject], canFocus);
}

- (void)setCanTarget:(bool)canTarget
{
	gtk_widget_set_can_target((GtkWidget*)[self castedGObject], canTarget);
}

- (void)setChildVisible:(bool)childVisible
{
	gtk_widget_set_child_visible((GtkWidget*)[self castedGObject], childVisible);
}

- (void)setCssClasses:(const char**)classes
{
	gtk_widget_set_css_classes((GtkWidget*)[self castedGObject], classes);
}

- (void)setCursor:(OGdkCursor*)cursor
{
	gtk_widget_set_cursor((GtkWidget*)[self castedGObject], [cursor castedGObject]);
}

- (void)setCursorFromName:(OFString*)name
{
	gtk_widget_set_cursor_from_name((GtkWidget*)[self castedGObject], [name UTF8String]);
}

- (void)setDirection:(GtkTextDirection)dir
{
	gtk_widget_set_direction((GtkWidget*)[self castedGObject], dir);
}

- (void)setFocusChild:(OGTKWidget*)child
{
	gtk_widget_set_focus_child((GtkWidget*)[self castedGObject], [child castedGObject]);
}

- (void)setFocusOnClick:(bool)focusOnClick
{
	gtk_widget_set_focus_on_click((GtkWidget*)[self castedGObject], focusOnClick);
}

- (void)setFocusable:(bool)focusable
{
	gtk_widget_set_focusable((GtkWidget*)[self castedGObject], focusable);
}

- (void)setFontMap:(OGPangoFontMap*)fontMap
{
	gtk_widget_set_font_map((GtkWidget*)[self castedGObject], [fontMap castedGObject]);
}

- (void)setFontOptions:(const cairo_font_options_t*)options
{
	gtk_widget_set_font_options((GtkWidget*)[self castedGObject], options);
}

- (void)setHalign:(GtkAlign)align
{
	gtk_widget_set_halign((GtkWidget*)[self castedGObject], align);
}

- (void)setHasTooltip:(bool)hasTooltip
{
	gtk_widget_set_has_tooltip((GtkWidget*)[self castedGObject], hasTooltip);
}

- (void)setHexpand:(bool)expand
{
	gtk_widget_set_hexpand((GtkWidget*)[self castedGObject], expand);
}

- (void)setHexpandSetWithSet:(bool)set
{
	gtk_widget_set_hexpand_set((GtkWidget*)[self castedGObject], set);
}

- (void)setLayoutManager:(OGTKLayoutManager*)layoutManager
{
	gtk_widget_set_layout_manager((GtkWidget*)[self castedGObject], [layoutManager castedGObject]);
}

- (void)setMarginBottom:(int)margin
{
	gtk_widget_set_margin_bottom((GtkWidget*)[self castedGObject], margin);
}

- (void)setMarginEnd:(int)margin
{
	gtk_widget_set_margin_end((GtkWidget*)[self castedGObject], margin);
}

- (void)setMarginStart:(int)margin
{
	gtk_widget_set_margin_start((GtkWidget*)[self castedGObject], margin);
}

- (void)setMarginTop:(int)margin
{
	gtk_widget_set_margin_top((GtkWidget*)[self castedGObject], margin);
}

- (void)setName:(OFString*)name
{
	gtk_widget_set_name((GtkWidget*)[self castedGObject], [name UTF8String]);
}

- (void)setOpacity:(double)opacity
{
	gtk_widget_set_opacity((GtkWidget*)[self castedGObject], opacity);
}

- (void)setOverflow:(GtkOverflow)overflow
{
	gtk_widget_set_overflow((GtkWidget*)[self castedGObject], overflow);
}

- (void)setParent:(OGTKWidget*)parent
{
	gtk_widget_set_parent((GtkWidget*)[self castedGObject], [parent castedGObject]);
}

- (void)setReceivesDefault:(bool)receivesDefault
{
	gtk_widget_set_receives_default((GtkWidget*)[self castedGObject], receivesDefault);
}

- (void)setSensitive:(bool)sensitive
{
	gtk_widget_set_sensitive((GtkWidget*)[self castedGObject], sensitive);
}

- (void)setSizeRequestWithWidth:(int)width height:(int)height
{
	gtk_widget_set_size_request((GtkWidget*)[self castedGObject], width, height);
}

- (void)setStateFlags:(GtkStateFlags)flags clear:(bool)clear
{
	gtk_widget_set_state_flags((GtkWidget*)[self castedGObject], flags, clear);
}

- (void)setTooltipMarkup:(OFString*)markup
{
	gtk_widget_set_tooltip_markup((GtkWidget*)[self castedGObject], [markup UTF8String]);
}

- (void)setTooltipText:(OFString*)text
{
	gtk_widget_set_tooltip_text((GtkWidget*)[self castedGObject], [text UTF8String]);
}

- (void)setValign:(GtkAlign)align
{
	gtk_widget_set_valign((GtkWidget*)[self castedGObject], align);
}

- (void)setVexpand:(bool)expand
{
	gtk_widget_set_vexpand((GtkWidget*)[self castedGObject], expand);
}

- (void)setVexpandSetWithSet:(bool)set
{
	gtk_widget_set_vexpand_set((GtkWidget*)[self castedGObject], set);
}

- (void)setVisible:(bool)visible
{
	gtk_widget_set_visible((GtkWidget*)[self castedGObject], visible);
}

- (bool)shouldLayout
{
	bool returnValue = (bool)gtk_widget_should_layout((GtkWidget*)[self castedGObject]);

	return returnValue;
}

- (void)show
{
	gtk_widget_show((GtkWidget*)[self castedGObject]);
}

- (void)sizeAllocateWithAllocation:(const GtkAllocation*)allocation baseline:(int)baseline
{
	gtk_widget_size_allocate((GtkWidget*)[self castedGObject], allocation, baseline);
}

- (void)snapshotChild:(OGTKWidget*)child snapshot:(OGTKSnapshot*)snapshot
{
	gtk_widget_snapshot_child((GtkWidget*)[self castedGObject], [child castedGObject], [snapshot castedGObject]);
}

- (bool)translateCoordinatesWithDestWidget:(OGTKWidget*)destWidget srcX:(double)srcX srcY:(double)srcY destX:(double*)destX destY:(double*)destY
{
	bool returnValue = (bool)gtk_widget_translate_coordinates((GtkWidget*)[self castedGObject], [destWidget castedGObject], srcX, srcY, destX, destY);

	return returnValue;
}

- (void)triggerTooltipQuery
{
	gtk_widget_trigger_tooltip_query((GtkWidget*)[self castedGObject]);
}

- (void)unmap
{
	gtk_widget_unmap((GtkWidget*)[self castedGObject]);
}

- (void)unparent
{
	gtk_widget_unparent((GtkWidget*)[self castedGObject]);
}

- (void)unrealize
{
	gtk_widget_unrealize((GtkWidget*)[self castedGObject]);
}

- (void)unsetStateFlags:(GtkStateFlags)flags
{
	gtk_widget_unset_state_flags((GtkWidget*)[self castedGObject], flags);
}


@end