if( NOT TARGET CinderSpout )
	get_filename_component( CINDERSPOUT_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )
	get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )

	add_library( CinderSpout ${CINDERSPOUT_SOURCE_PATH}/src/test.cpp)
	
	target_include_directories( CinderSpout PUBLIC "${CINDERSPOUT_SOURCE_PATH}/include" )
	target_include_directories( CinderSpout SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )
	
	


	if( NOT TARGET cinder )
		    include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
		    find_package( cinder REQUIRED PATHS
		        "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
		        "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
	endif()
	target_link_libraries(CinderSpout PRIVATE cinder )
	
endif()



