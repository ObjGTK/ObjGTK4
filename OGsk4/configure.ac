AC_INIT(OGsk4, 4.0, unkown@host.com)
AC_CONFIG_SRCDIR(src)
AC_CONFIG_AUX_DIR(build-aux)
AC_CONFIG_MACRO_DIR(build-aux/m4)

for i in configure.ac build-aux/m4/*; do
	AS_IF([test $i -nt configure], [
		AC_MSG_ERROR([$i is newer than configure! Run ./autogen.sh!])
	])
done

AC_CHECK_TOOL(OBJFW_CONFIG, objfw-config)
AS_IF([test x"$OBJFW_CONFIG" = x""], [
	AC_MSG_ERROR(You need ObjFW and objfw-config installed!)
])

test x"$OBJC" = x"" && OBJC="$($OBJFW_CONFIG --objc)"

AC_LANG([Objective C])
AC_PROG_OBJC
AC_PROG_OBJCPP
AC_PROG_LN_S
AC_PROG_INSTALL

CPP="$OBJCPP"
CPPFLAGS="$CPPFLAGS $OBJCPPFLAGS $($OBJFW_CONFIG --cppflags)"
OBJCFLAGS="$OBJCFLAGS -Wall $($OBJFW_CONFIG --objcflags)"
LDFLAGS="$LDFLAGS $($OBJFW_CONFIG --ldflags --rpath)"
FRAMEWORK_LIBS="$($OBJFW_CONFIG --framework-libs)"
LIBS="$($OBJFW_CONFIG --libs --rpath)"

AX_CHECK_COMPILER_FLAGS(-Wno-deprecated-declarations,
	[OBJCFLAGS="$OBJCFLAGS -Wno-deprecated-declarations"])

AX_CHECK_COMPILER_FLAGS(-Wno-deprecated,
	[OBJCFLAGS="$OBJCFLAGS -Wno-deprecated"])

AC_ARG_ENABLE(shared,
	AS_HELP_STRING([--disable-shared], [do not build shared library]))
AS_IF([test x"$enable_shared" != x"no"], [
	BUILDSYS_SHARED_LIB
	AC_SUBST(OGSK4_SHARED_LIB, "${LIB_PREFIX}ogsk4${LIB_SUFFIX}")

	BUILDSYS_FRAMEWORK([
		AC_SUBST(OGSK4_FRAMEWORK, "OGsk4.framework")
	])
])
AC_ARG_ENABLE(static, AS_HELP_STRING([--enable-static], [build static library]))
AS_IF([test x"$enable_static" = x"yes" -o x"$enable_shared" = x"no"], [
	AC_PATH_TOOL(AR, ar)
	AC_PROG_RANLIB
	AC_SUBST(OGSK4_STATIC_LIB, "libogsk4.a")
])

AC_MSG_CHECKING(for ObjFW package OGObject)
AS_IF([$OBJFW_CONFIG --package OGObject], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGObject --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGObject --libs)"
	FRAMEWORK_LIBS="$($OBJFW_CONFIG --package OGObject --framework-libs) $FRAMEWORK_LIBS"
], [
	AC_MSG_ERROR(You need ObjFW package OGObject installed.)
])
AC_MSG_CHECKING(for ObjFW package OGdk4)
AS_IF([$OBJFW_CONFIG --package OGdk4], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGdk4 --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGdk4 --libs)"
	FRAMEWORK_LIBS="$($OBJFW_CONFIG --package OGdk4 --framework-libs) $FRAMEWORK_LIBS"
], [
	AC_MSG_ERROR(You need ObjFW package OGdk4 installed.)
])


AC_ARG_WITH(gt, AS_HELP_STRING([--with-gt=PREFIX],
	[build with gtk4 in the specified prefix]))
AS_IF([test x"$with_gt" != x"no" -a x"$with_gt" != x""], [
       OGSK4_CPPFLAGS="$OGSK4_CPPFLAGS -I$with_gt/include"
       OGSK4_LIBS="$OGSK4_LIBS -L$with_gt/lib"
       CPPFLAGS="-I$with_gt/include $CPPFLAGS"
       LIBS="-L$with_gt/lib $LIBS"
       FRAMEWORK_LIBS="-L$with_gt/lib $FRAMEWORK_LIBS"
])


PKG_CHECK_MODULES(gt, [gtk4 >= $(pkg-config --modversion gtk4)], [
	OGSK4_CPPFLAGS="$OGSK4_CPPFLAGS $gt_CFLAGS"
	OGSK4_LIBS="$OGSK4_LIBS $gt_LIBS"
	CPPFLAGS="$CPPFLAGS $gt_CFLAGS"
	LIBS="$LIBS $gt_LIBS"
	FRAMEWORK_LIBS="$FRAMEWORK_LIBS $gt_LIBS"
], [
	AC_MSG_ERROR(You need gtk4 >= $(pkg-config --modversion gtk4) installed!)
])

AS_IF([test x"$GOBJC" = x"yes"], [
	OBJCFLAGS="$OBJCFLAGS -Wwrite-strings -Wpointer-arith -Werror"
])

BUILDSYS_INIT

dnl We don't call AC_PROG_CPP, but only AC_PROG_OBJCPP and set CPP to OBJCPP
dnl and add OBJCPPFLAGS to CPPFLAGS, thus we need to AC_SUBST these ourself.
AC_SUBST(CPP)
AC_SUBST(CPPFLAGS)

AC_SUBST(OGSK4_CPPFLAGS)
AC_SUBST(OGSK4_LIBS)

AC_CONFIG_FILES([buildsys.mk extra.mk OGsk4.oc src/Info.plist])
AC_OUTPUT
