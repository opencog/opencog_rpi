#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# this module will set the following variables

# This module sets the following variables:

#   BLAS_FOUND - set to true if a library implementing the BLAS interface
#     is found
#   BLAS_LINKER_FLAGS - uncached list of required linker flags (excluding -l
#     and -L).
#   BLAS_LIBRARIES - uncached list of libraries (using full path name) t
#     link against to use BLAS
#   BLAS95_LIBRARIES - uncached list of libraries (using full path name)
#     to link against to use BLAS95 interface
#   BLAS95_FOUND - set to true if a library implementing the BLAS f95 interfa
#     is found
#   BLA_STATIC  if set on this determines what kind of linkage we do (static)
#   BLA_VENDOR  if set checks only the specified vendor, if not set checks   
#      all the possibilities
#   BLA_F95     if set on tries to find the f95 interfaces for BLAS/LAPACK   


find_library(F77BLAS_LIBRARY 
	NAMES f77blas
	PATH /usr/lib /usr/lib/atlas-base/ /usr/local/lib /usr/local/lib/atlas-base)

find_library(ATLAS_LIBRARY 
	NAMES atlas
	PATH /usr/lib /usr/lib/atlas-base /usr/local/lib /usr/local/lib/atlas-base)

if (F77BLAS_LIBRARY AND ATLAS_LIBRARY)
	SET(BLAS_FOUND TRUE)
	LIST(APPEND BLAS_LIBRARIES ${F77BLAS_LIBRARY}
				   ${ATLAS_LIBRARY})
endif (F77BLAS_LIBRARY AND ATLAS_LIBRARY)

if ( BLAS_FOUND )
	message( STATUS "Found BLAS at ${BLAS_LIBRARIES}")
else (BLAS_FOUND )
	message( STATUS "BLAS not found")
endif ( BLAS_FOUND )
