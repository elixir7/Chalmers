##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=SDLproject
ConfigurationName      :=Debug
WorkspacePath          :=/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup
ProjectPath            :=/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/SDLproject
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Isak Åslund
Date                   :=28/04/2017
CodeLitePath           :="/Users/isak/Library/Application Support/codelite"
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -dynamiclib -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="SDLproject.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -F./ -framework SDL2_ttf -framework SDL2_image -framework SDL2
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -std=c99 -F./ $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
Objects0=$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IntermediateDirectory)/alien.c$(ObjectSuffix) $(IntermediateDirectory)/background.c$(ObjectSuffix) $(IntermediateDirectory)/misc.c$(ObjectSuffix) $(IntermediateDirectory)/renderer.c$(ObjectSuffix) $(IntermediateDirectory)/ship.c$(ObjectSuffix) $(IntermediateDirectory)/src_gameobject.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main.c$(ObjectSuffix): main.c $(IntermediateDirectory)/main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/SDLproject/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.c$(DependSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/main.c$(DependSuffix) -MM main.c

$(IntermediateDirectory)/main.c$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.c$(PreprocessSuffix) main.c

$(IntermediateDirectory)/alien.c$(ObjectSuffix): alien.c $(IntermediateDirectory)/alien.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/SDLproject/alien.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/alien.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/alien.c$(DependSuffix): alien.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/alien.c$(ObjectSuffix) -MF$(IntermediateDirectory)/alien.c$(DependSuffix) -MM alien.c

$(IntermediateDirectory)/alien.c$(PreprocessSuffix): alien.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/alien.c$(PreprocessSuffix) alien.c

$(IntermediateDirectory)/background.c$(ObjectSuffix): background.c $(IntermediateDirectory)/background.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/SDLproject/background.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/background.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/background.c$(DependSuffix): background.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/background.c$(ObjectSuffix) -MF$(IntermediateDirectory)/background.c$(DependSuffix) -MM background.c

$(IntermediateDirectory)/background.c$(PreprocessSuffix): background.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/background.c$(PreprocessSuffix) background.c

$(IntermediateDirectory)/misc.c$(ObjectSuffix): misc.c $(IntermediateDirectory)/misc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/SDLproject/misc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/misc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/misc.c$(DependSuffix): misc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/misc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/misc.c$(DependSuffix) -MM misc.c

$(IntermediateDirectory)/misc.c$(PreprocessSuffix): misc.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/misc.c$(PreprocessSuffix) misc.c

$(IntermediateDirectory)/renderer.c$(ObjectSuffix): renderer.c $(IntermediateDirectory)/renderer.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/SDLproject/renderer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/renderer.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/renderer.c$(DependSuffix): renderer.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/renderer.c$(ObjectSuffix) -MF$(IntermediateDirectory)/renderer.c$(DependSuffix) -MM renderer.c

$(IntermediateDirectory)/renderer.c$(PreprocessSuffix): renderer.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/renderer.c$(PreprocessSuffix) renderer.c

$(IntermediateDirectory)/ship.c$(ObjectSuffix): ship.c $(IntermediateDirectory)/ship.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/SDLproject/ship.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ship.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ship.c$(DependSuffix): ship.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ship.c$(ObjectSuffix) -MF$(IntermediateDirectory)/ship.c$(DependSuffix) -MM ship.c

$(IntermediateDirectory)/ship.c$(PreprocessSuffix): ship.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ship.c$(PreprocessSuffix) ship.c

$(IntermediateDirectory)/src_gameobject.c$(ObjectSuffix): src/gameobject.c $(IntermediateDirectory)/src_gameobject.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/SDLproject/src/gameobject.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_gameobject.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_gameobject.c$(DependSuffix): src/gameobject.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_gameobject.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_gameobject.c$(DependSuffix) -MM src/gameobject.c

$(IntermediateDirectory)/src_gameobject.c$(PreprocessSuffix): src/gameobject.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_gameobject.c$(PreprocessSuffix) src/gameobject.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


