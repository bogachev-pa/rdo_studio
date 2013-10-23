IF(MSVC_IDE)
    SET(CONFIG_DIRECTORY_DEBUG   ${EXECUTABLE_OUTPUT_PATH}/Debug  )
    SET(CONFIG_DIRECTORY_RELEASE ${EXECUTABLE_OUTPUT_PATH}/Release)
ELSE()
    SET(CONFIG_DIRECTORY_DEBUG   ${EXECUTABLE_OUTPUT_PATH})
    SET(CONFIG_DIRECTORY_RELEASE ${EXECUTABLE_OUTPUT_PATH})
ENDIF()

SET(QT_LIBRARY_DIR       $ENV{QTDIR}/bin              )
SET(QT_PLATFORM_DIR      $ENV{QTDIR}/plugins/platforms)

FIND_FILE(DLL_ICUUC       icuuc51.dll        PATHS ${QT_LIBRARY_DIR})
FIND_FILE(DLL_ICUIN       icuin51.dll        PATHS ${QT_LIBRARY_DIR})
FIND_FILE(DLL_ICUDT       icudt51.dll        PATHS ${QT_LIBRARY_DIR})
FIND_FILE(DLL_D3DCOMPILER D3DCompiler_43.dll PATHS ${QT_LIBRARY_DIR})

FIND_FILE(DLL_D_QT_CORE    Qt5Cored.dll    PATHS ${QT_LIBRARY_DIR})
FIND_FILE(DLL_D_QT_CUI     Qt5Guid.dll     PATHS ${QT_LIBRARY_DIR})
FIND_FILE(DLL_D_QT_WIDGETS Qt5Widgetsd.dll PATHS ${QT_LIBRARY_DIR})

FIND_FILE(DLL_GLES libEGL.dll    PATHS ${QT_LIBRARY_DIR})
FIND_FILE(DLL_EGL  libGLESv2.dll PATHS ${QT_LIBRARY_DIR})

FIND_FILE(DLL_D_QWINDOWS qwindowsd.dll PATHS ${QT_PLATFORM_DIR})
FIND_FILE(DLL_D_QMINIMAL qminimald.dll PATHS ${QT_PLATFORM_DIR})

IF (MSVC90)
	FIND_FILE(DLL_D_MSVCR msvcp90d.dll)
	FIND_FILE(DLL_D_MSVCP msvcr90d.dll)
	FIND_FILE(DLL_R_MSVCR msvcp90.dll)
	FIND_FILE(DLL_R_MSVCP msvcr90.dll)
ELSE()
	FIND_FILE(DLL_D_MSVCP msvcp100d.dll)
	FIND_FILE(DLL_D_MSVCR msvcr100d.dll)
	FIND_FILE(DLL_R_MSVCP msvcp100.dll)
	FIND_FILE(DLL_R_MSVCR msvcr100.dll)
ENDIF()

FIND_FILE(DLL_R_QT_CORE    Qt5Core.dll    PATHS ${QT_LIBRARY_DIR})
FIND_FILE(DLL_R_QT_CUI     Qt5Gui.dll     PATHS ${QT_LIBRARY_DIR})
FIND_FILE(DLL_R_QT_WIDGETS Qt5Widgets.dll PATHS ${QT_LIBRARY_DIR})

FIND_FILE(DLL_R_QWINDOWS qwindows.dll PATHS ${QT_PLATFORM_DIR})
FIND_FILE(DLL_R_QMINIMAL qminimal.dll PATHS ${QT_PLATFORM_DIR})

SET(CONFIG_DLL_D
    ${DLL_ICUUC}
    ${DLL_ICUIN}
    ${DLL_ICUDT}
    ${DLL_D3DCOMPILER}
    ${DLL_D_QT_CORE}
    ${DLL_D_QT_CUI}
    ${DLL_D_QT_WIDGETS}
    ${DLL_GLES}
    ${DLL_EGL}
    ${DLL_D_QWINDOWS}
    ${DLL_D_QMINIMAL}
    ${DLL_D_MSVCR}
    ${DLL_D_MSVCP}
    )

FILE(COPY ${CONFIG_DLL_D} DESTINATION ${CONFIG_DIRECTORY_DEBUG}  )

SET(CONFIG_DLL_R
    ${DLL_ICUUC}
    ${DLL_ICUIN}
    ${DLL_ICUDT}
    ${DLL_D3DCOMPILER}
    ${DLL_R_QT_CORE}
    ${DLL_R_QT_CUI}
    ${DLL_R_QT_WIDGETS}
    ${DLL_GLES}
    ${DLL_EGL}
    ${DLL_R_QWINDOWS}
    ${DLL_R_QMINIMAL}
    ${DLL_R_MSVCR}
    ${DLL_R_MSVCP}
    )

FILE(COPY ${CONFIG_DLL_R} DESTINATION ${CONFIG_DIRECTORY_RELEASE})

CONFIGURE_FILE(${CMAKE_MODULE_PATH}/win32.install.iss.cmake ${CONFIG_DIRECTORY_RELEASE}/win32.install.iss)
