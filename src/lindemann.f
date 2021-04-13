c
c   Dint – version 2.0  is licensed under the Apache License, Version 2.0 (the "License");
c   you may not use Dint – version 2.0 except in compliance with the License.
c   You may obtain a copy of the License at
c       http://www.apache.org/licenses/LICENSE-2.0
c   The license is also given in the LICENSE file.
c   Unless required by applicable law or agreed to in writing, software
c   distributed under the License is distributed on an "AS IS" BASIS,
c   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
c   See the License for the specific language governing permissions and limitations under the License.
c
c -------------------------------------------------------------------------------------------
c  Dint : Direct Nonadiabatic Trajectories A code for non-Born–Oppenheimer molecular dynamics 
c  
c  version 2.0                                    
c
c  A. W. Jasper                  
c  Argonne National Laboratory     
c
c  Rui Ming Zhang                 
c  Tsinghua University
c               
c  and                  
c    
c  D. G. Truhlar                 
c  University of Minnesota
c
c  copyright  2020
c  Donald G. Truhlar and Regents of the University of Minnesota 
c----------------------------------------------------------------------------------------------

      subroutine lindemann(xx,nclu,step,time,arij,arij2,lind)

      implicit none
      include 'param.f'

      integer i,j,k,nclu
      double precision xx(3,mnat),lind,arij2(mnat,mnat),
     & arij(mnat,mnat),rij,tmp1,tmp2,step,time

      lind = 0.d0
      do i=1,nclu
      do j=i+1,nclu
        rij = 0.d0
        do k=1,3
        rij = rij + (xx(k,i)-xx(k,j))**2
        enddo
        arij(i,j) = arij(i,j) + dsqrt(rij)*step
        arij2(i,j) = arij2(i,j) + rij*step
        tmp1 = arij(i,j)  / time
        tmp2 = arij2(i,j) / time
        if (tmp2.gt.tmp1**2) lind = lind + dsqrt(tmp2-tmp1**2)/tmp1
      enddo
      enddo

      lind = lind*2.d0/dble(nclu*(nclu-1))

      return
 
      end
