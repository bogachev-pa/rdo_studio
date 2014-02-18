#==============================================================================
# Copyright (c) 2013 Urusov Andrey <drobus@gmail.com>
#==============================================================================

MACRO(RDO_BISON_TARGET FILE_TYPE)

	MAKE_DIRECTORY(${GRAMMA_OUTPUT_PATH})

	SET(BISON_${FILE_TYPE}_INPUT ${GRAMMA_INPUT_PATH}/rdo${FILE_TYPE}.y)

	SET(CPP_OUTPUT_FILE ${GRAMMA_OUTPUT_PATH}/rdogram${FILE_TYPE}.cpp)
	SET(BISON_${FILE_TYPE}_OUTPUTS ${CPP_OUTPUT_FILE})
	SET(OUTPUT_FILE ${CPP_OUTPUT_FILE})

	LIST(APPEND OUTPUT_FILE ${GRAMMA_OUTPUT_PATH}/rdogram${FILE_TYPE}.dot)
	LIST(APPEND OUTPUT_FILE ${GRAMMA_OUTPUT_PATH}/rdogram${FILE_TYPE}.output)

	SET(BISON_NAME ${FILE_TYPE})
	SET(BISON_DEFINE)
	SET(BISON_${FILE_TYPE}_OUTPUT_HEADER)
	IF(${ARGC} GREATER 2 OR ${ARGC} EQUAL 2)
		SET(BISON_NAME ${ARGV1})
		IF(${ARGC} GREATER 3 OR ${ARGC} EQUAL 3)
			SET(BISON_${FILE_TYPE}_OUTPUT_HEADER ${GRAMMA_H})
			SET(BISON_DEFINE --defines=${BISON_${FILE_TYPE}_OUTPUT_HEADER})
			LIST(APPEND OUTPUT_FILE ${BISON_${FILE_TYPE}_OUTPUT_HEADER})
		ENDIF()
	ENDIF()

	IF(MSVC)
		ADD_CUSTOM_COMMAND(
			OUTPUT ${OUTPUT_FILE}
			COMMAND set CYGWIN=nodosfilewarning
			COMMAND set BISON_PKGDATADIR=${BISON_FLEX_DIRECTORY}/share/bison
			COMMAND ${BISON_EXECUTABLE} ARGS -g -v ${BISON_DEFINE} -p${BISON_NAME} -o ${CPP_OUTPUT_FILE} ${BISON_${FILE_TYPE}_INPUT}
			DEPENDS ${BISON_${FILE_TYPE}_INPUT}
			COMMENT "[BISON][rdo${FILE_TYPE}] Building parser with bison ${BISON_VERSION}"
			WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
		)
		SET_SOURCE_FILES_PROPERTIES(${CPP_OUTPUT_FILE} PROPERTIES COMPILE_FLAGS "/Od")
	ELSE()
		ADD_CUSTOM_COMMAND(
			OUTPUT ${OUTPUT_FILE}
			COMMAND ${BISON_EXECUTABLE} ARGS -g -v ${BISON_DEFINE} -p${BISON_NAME} -o ${CPP_OUTPUT_FILE} ${BISON_${FILE_TYPE}_INPUT}
			DEPENDS ${BISON_${FILE_TYPE}_INPUT}
			COMMENT "[BISON][rdo${FILE_TYPE}] Building parser with bison ${BISON_VERSION}"
			WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
		)
	ENDIF()
ENDMACRO()

MACRO(RDO_FLEX_TARGET Name Input Output)
	SET(FLEX_EXECUTABLE_opts  "${ARGV4}")
	SEPARATE_ARGUMENTS(FLEX_EXECUTABLE_opts)

	IF(MSVC)
		ADD_CUSTOM_COMMAND(
			OUTPUT ${Output}
			COMMAND set CYGWIN=nodosfilewarning
			COMMAND ${FLEX_EXECUTABLE}
			ARGS ${FLEX_EXECUTABLE_opts} -o${Output} ${Input}
			DEPENDS ${Input}
			COMMENT "[FLEX][${Name}] Building scanner with flex ${FLEX_VERSION}"
			WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
		SET_SOURCE_FILES_PROPERTIES(${Output} PROPERTIES COMPILE_FLAGS "/Od")
	ELSE()
		ADD_CUSTOM_COMMAND(
			OUTPUT ${Output}
			COMMAND ${FLEX_EXECUTABLE}
			ARGS ${FLEX_EXECUTABLE_opts} -o${Output} ${Input}
			DEPENDS ${Input}
			COMMENT "[FLEX][${Name}] Building scanner with flex ${FLEX_VERSION}"
			WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
	ENDIF()

	SET(FLEX_${Name}_OUTPUTS ${Output})
ENDMACRO()
