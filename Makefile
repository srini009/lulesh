#default build suggestion of MPI + OPENMP with gcc on Livermore machines you might have to change the compiler name

SHELL = /bin/sh
.SUFFIXES: .cc .o

LULESH_EXEC = lulesh2.0

MPI_INC = /opt/local/include/openmpi
MPI_LIB = /opt/local/lib

SERCXX = CC -DUSE_MPI=0
MPICXX = CC -DUSE_MPI=1
CXX = $(MPICXX)

SOURCES2.0 = \
	lulesh.cc \
	lulesh-comm.cc \
	lulesh-viz.cc \
	lulesh-util.cc \
	lulesh-init.cc
OBJECTS2.0 = $(SOURCES2.0:.cc=.o)

#Default build suggestions with OpenMP for g++
CXXFLAGS = -g -O3 -I. -Wall -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/conduit-develop-outwmkpytve6lz535b5aie6edf655v6n/include -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/conduit-develop-outwmkpytve6lz535b5aie6edf655v6n/include/conduit -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/ascent-develop-yuey7idgcnprmvpknlqhkrolbi47awak/include/ascent -I/home/sramesh/VIZ_SERVICE/serviz/build/include -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/json-c-0.15-mgh2reoubqvdtfgt4pb3fuqapnzus5oi/include -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/json-c-0.15-mgh2reoubqvdtfgt4pb3fuqapnzus5oi/include/json-c -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/mochi-thallium-0.9.1-oc22tai5gnighsaayn6wnhq3c6g4xxwc/include -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/cereal-1.3.0-uzlc2r6qlpyudripdfukiunztkbbctud/include -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/mochi-margo-0.9.5-2y7o6eu3iofccksos3kzgtnxe4fnptmk/include -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/mercury-2.1.0-22odiy27pcxfxpsg2eoueuch6vaknin4/include -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/boost-1.78.0-nxowvyc6x6lidhilvzb4rknazdrldhi5/include -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/argobots-1.1-bmmqve47myhfkslai7kp3dirr5nss4zd/include -I/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/nlohmann-json-3.10.4-ik7ryghpxrenvwdu4jn5t6ord6ilgrcw/include #-fopenmp
LDFLAGS = -g -O3 -L/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/conduit-develop-outwmkpytve6lz535b5aie6edf655v6n/lib/ -lconduit -lconduit_blueprint -L/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/ascent-develop-yuey7idgcnprmvpknlqhkrolbi47awak/lib -lascent_mpi -L/home/sramesh/VIZ_SERVICE/serviz/build/lib -L/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/json-c-0.15-mgh2reoubqvdtfgt4pb3fuqapnzus5oi/lib64 -L/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/mochi-margo-0.9.5-2y7o6eu3iofccksos3kzgtnxe4fnptmk/lib -L/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/mercury-2.1.0-22odiy27pcxfxpsg2eoueuch6vaknin4/lib -L/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/argobots-1.1-bmmqve47myhfkslai7kp3dirr5nss4zd/lib -L/gpfs/mira-home/sramesh/spack/opt/spack/cray-cnl7-haswell/gcc-9.3.0/libuuid-1.0.3-a6a2mzpneqirfzugmiduv5zxfj6653qw/lib -lams-client -lstdc++ -lmargo -lmercury_hl -lmercury -lmchecksum -lmercury_util -lna -labt -ljson-c -luuid #-fopenmp

#Below are reasonable default flags for a serial build
#CXXFLAGS = -g -O3 -I. -Wall
#LDFLAGS = -g -O3 

#common places you might find silo on the Livermore machines.
#SILO_INCDIR = /opt/local/include
#SILO_LIBDIR = /opt/local/lib
#SILO_INCDIR = ./silo/4.9/1.8.10.1/include
#SILO_LIBDIR = ./silo/4.9/1.8.10.1/lib

#If you do not have silo and visit you can get them at:
#silo:  https://wci.llnl.gov/codes/silo/downloads.html
#visit: https://wci.llnl.gov/codes/visit/download.html

#below is and example of how to make with silo, hdf5 to get vizulization by default all this is turned off.  All paths are Livermore specific.
#CXXFLAGS = -g -DVIZ_MESH -I${SILO_INCDIR} -Wall -Wno-pragmas
#LDFLAGS = -g -L${SILO_LIBDIR} -Wl,-rpath -Wl,${SILO_LIBDIR} -lsiloh5 -lhdf5

.cc.o: lulesh.h
	@echo "Building $<"
	$(CXX) -c $(CXXFLAGS) -o $@  $<

all: $(LULESH_EXEC)

$(LULESH_EXEC): $(OBJECTS2.0)
	@echo "Linking"
	$(CXX) $(OBJECTS2.0) $(LDFLAGS) -lm -o $@

clean:
	/bin/rm -f *.o *~ $(OBJECTS) $(LULESH_EXEC)
	/bin/rm -rf *.dSYM

tar: clean
	cd .. ; tar cvf lulesh-2.0.tar LULESH-2.0 ; mv lulesh-2.0.tar LULESH-2.0
