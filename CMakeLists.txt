####################################################
#                                                  #
# Compiles DiNT (Direct Nonadiabatic Trajectories) #
#   for Linux                                      #
#                                                  #
####################################################
project(DiNT Fortran)
cmake_minimum_required(VERSION 3.12)

# Define potential to compile
set(POT
#"tbplusexp6-2"
#"tbplusexp6all"
"ch4hALL"
#"ch4oALL"
)

find_package(BLAS REQUIRED)
find_package(LAPACK REQUIRED)

if(LAPACK_FOUND AND BLAS_FOUND)
    message(STATUS "Found BLAS: ${BLAS_LIBRARIES}")
    message(STATUS "Found LAPACK: ${LAPACK_LIBRARIES}")
endif()


add_subdirectory("src")
#list(APPEND EXTRA_INCLUDES "${CMAKE_SOURCE_DIR}/src")


find_package(MPI REQUIRED)
list(APPEND EXTRA_INCLUDES "${MPI_INCLUDE_PATH}")
if(MPI_FOUND)
  list(APPEND EXTRA_FFLAGS "-DMPI")
  include_directories(${MPI_Fortran_INCLUDE_DIRS})
endif(MPI_FOUND)


add_executable(dint-${POT}.x $<TARGET_OBJECTS:objs> ${CMAKE_SOURCE_DIR}/src/)

#set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${EXTRA_FFLAGS}")
#target_link_options(dint-${POT}.x PRIVATE
#    "-llapack -lablas -lmlfg"
#)

list(APPEND MPI_LIBS "${MPI_LIBRARIES}")
target_link_libraries(dint-${POT}.x PUBLIC
     ${MPI_LIBS})

target_link_libraries(dint-${POT}.x PUBLIC
    ${BLAS_LIBRARIES} ${LAPACK_LIBRARIES} ${EXTRA_LIBS})

target_include_directories(dint-${POT}.x PUBLIC ${EXTRA_INCLUDES})

if(MPI_COMPILE_FLAGS)
  set_target_properties(dint-${POT}.x PROPERTIES
                        COMPILE_FLAGS "${MPI_COMPILE_FLAGS}")
endif()

if(MPI_LINK_FLAGS)
  set_target_properties(dint-${POT}.x PROPERTIES
                        LINK_FLAGS "${MPI_LINK_FLAGS}")
endif()

install(TARGETS dint-${POT}.x DESTINATION ${CMAKE_SOURCE_DIR}/bin)

