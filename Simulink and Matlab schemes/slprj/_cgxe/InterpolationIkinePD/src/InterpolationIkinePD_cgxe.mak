# ------------------- Required for MSVC nmake ---------------------------------
# This file should be included at the top of a MAKEFILE as follows:


CPU = AMD64

MODEL  = InterpolationIkinePD
TARGET = cgxe
MODULE_SRCS 	= m_v5VTtcRQevfNVdrzA5wKAG.c
MODEL_SRC	= InterpolationIkinePD_cgxe.c
MODEL_REG = InterpolationIkinePD_cgxe_registry.c
MAKEFILE    = InterpolationIkinePD_cgxe.mak
MATLAB_ROOT	= F:\Matlab2020a
BUILDARGS   =

#--------------------------- Tool Specifications ------------------------------
#
#
MSVC_ROOT1 = $(MSDEVDIR:SharedIDE=vc)
MSVC_ROOT2 = $(MSVC_ROOT1:SHAREDIDE=vc)
MSVC_ROOT  = $(MSVC_ROOT2:sharedide=vc)

# Compiler tool locations, CC, LD, LIBCMD:
CC     = cl.exe
LD     = link.exe
LIBCMD = lib.exe
#------------------------------ Include/Lib Path ------------------------------


USER_INCLUDES   =  /I "D:\fe leto 1\vodenje project\simulink and matlab schemes\slprj\_cgxe\interpolationikinepd\src" /I "D:\fe leto 1\vodenje project\simulink and matlab schemes" /I "D:\FE Leto 1\Vodenje Project\Simulink and Matlab schemes\slprj\_cprj"

MLSL_INCLUDES     = \
    /I "F:\Matlab2020a\extern\include" \
    /I "F:\Matlab2020a\simulink\include" \
    /I "F:\Matlab2020a\rtw\c\src"
COMPILER_INCLUDES = /I "$(MSVC_ROOT)\include"

THIRD_PARTY_INCLUDES   =  /I "D:\FE Leto 1\Vodenje Project\Simulink and Matlab schemes\slprj\_cgxe\InterpolationIkinePD\src" /I "D:\FE Leto 1\Vodenje Project\Simulink and Matlab schemes"
INCLUDE_PATH = $(MLSL_INCLUDES) $(USER_INCLUDES) $(THIRD_PARTY_INCLUDES)
LIB_PATH     = "$(MSVC_ROOT)\lib"
CFLAGS = /c /Zp8 /GR /W3 /EHs /D_CRT_SECURE_NO_DEPRECATE /D_SCL_SECURE_NO_DEPRECATE /D_SECURE_SCL=0 /DMX_COMPAT_64 /DMATLAB_MEXCMD_RELEASE=R2018a /DMATLAB_MEX_FILE /nologo /MD   -DHAVE_LAPACK_CONFIG_H -DLAPACK_COMPLEX_STRUCTURE -DMW_HAVE_LAPACK_DECLS
LDFLAGS = /nologo /dll /MANIFEST /OPT:NOREF /export:mexFunction /export:mexfilerequiredapiversion  
#----------------------------- Source Files -----------------------------------

USER_OBJS =

AUX_SRCS = F:\Matlab2020a\extern\version\c_mexapi_version.c  

REQ_SRCS  = $(MODEL_SRC) $(MODEL_REG) $(MODULE_SRCS) $(AUX_SRCS)
REQ_OBJS = $(REQ_SRCS:.cpp=.obj)
REQ_OBJS2 = $(REQ_OBJS:.c=.obj)
OBJS = $(REQ_OBJS2) $(USER_OBJS) $(AUX_ABS_OBJS)
OBJLIST_FILE = InterpolationIkinePD_cgxe.mol
TMWLIB = "F:\Matlab2020a\extern\lib\win64\microsoft\libmx.lib" "F:\Matlab2020a\extern\lib\win64\microsoft\libmex.lib" "F:\Matlab2020a\extern\lib\win64\microsoft\libmat.lib" "F:\Matlab2020a\extern\lib\win64\microsoft\libfixedpoint.lib" "F:\Matlab2020a\extern\lib\win64\microsoft\libut.lib" "F:\Matlab2020a\extern\lib\win64\microsoft\libmwmathutil.lib" "F:\Matlab2020a\extern\lib\win64\microsoft\libemlrt.lib" "F:\Matlab2020a\extern\lib\win64\microsoft\libmwcgxert.lib" "F:\Matlab2020a\extern\lib\win64\microsoft\libmwslexec_simbridge.lib" "F:\Matlab2020a\lib\win64\libmwipp.lib" "F:\Matlab2020a\extern\lib\win64\microsoft\libcovrt.lib" "F:\Matlab2020a\extern\lib\win64\microsoft\libmwsl_sfcn_cov_bridge.lib" 
THIRD_PARTY_LIBS = 

#--------------------------------- Rules --------------------------------------

MEX_FILE_NAME_WO_EXT = $(MODEL)_$(TARGET)
MEX_FILE_NAME = $(MEX_FILE_NAME_WO_EXT).mexw64
all : $(MEX_FILE_NAME) 


$(MEX_FILE_NAME) : $(MAKEFILE) $(OBJS)
	@echo ### Linking ...
	$(LD) $(LDFLAGS) /OUT:$(MEX_FILE_NAME) /map:"$(MEX_FILE_NAME_WO_EXT).map" $(TMWLIB) $(THIRD_PARTY_LIBS) @$(OBJLIST_FILE)
     mt -outputresource:"$(MEX_FILE_NAME);2" -manifest "$(MEX_FILE_NAME).manifest"
	@echo ### Created $@

.c.obj :
	@echo ### Compiling "$<"
	$(CC) $(CFLAGS) $(INCLUDE_PATH) "$<"

.cpp.obj :
	@echo ### Compiling "$<"
	$(CC) $(CFLAGS) $(INCLUDE_PATH) "$<"

