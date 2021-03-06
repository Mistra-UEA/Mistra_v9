! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!                                                                  
! Global Data Header File                                          
!                                                                  
! Generated by KPP-2.2.4 for Mistra symbolic chemistry Kinetics PreProcessor
!       (http://www.cs.vt.edu/~asandu/Software/Kpp)                
! KPP is distributed under GPL, the general public licence         
!       (http://www.gnu.org/copyleft/gpl.html)                     
! (C) 1995-1997, V. Damian & A. Sandu, CGRER, Univ. Iowa           
! (C) 1997-2005, A. Sandu, Michigan Tech, Virginia Tech            
!     With important contributions from:                           
!        M. Damian, Villanova University, USA                      
!        R. Sander, Max-Planck Institute for Chemistry, Mainz, Germany
!                                                                  
! File                 : tot_Global.h                              
! Time                 : Wed Jul 14 18:27:05 2021                  
! Working directory    : /local/josue/Mistra_2019/src/mech         
! Equation file        : tot.k                                     
! Output root filename : tot                                       
!                                                                  
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




! Declaration of global variables                                  

! C - Concentration of all species                                 
      REAL*8 C(NSPEC)
      COMMON /GDATA_t/ C
! VAR - Concentrations of variable species (global)                
      REAL*8 VAR(NVAR)
! FIX - Concentrations of fixed species (global)                   
      REAL*8 FIX(NFIX)
! VAR, FIX are chunks of array C                                   
      EQUIVALENCE( C(1),VAR(1) )
      EQUIVALENCE( C(418),FIX(1) )
! RCONST - Rate constants (global)                                 
      REAL*8 RCONST(NREACT)
      COMMON /GDATA_t/ RCONST
! TIME - Current integration time                                  
      REAL*8 TIME
      COMMON /GDATA_t/ TIME
! DT - Integration step                                            
      REAL*8 DT
      COMMON /GDATA_t/ DT
! ATOL - Absolute tolerance                                        
      REAL*8 ATOL(NVAR)
      COMMON /GDATA_t/ ATOL
! RTOL - Relative tolerance                                        
      REAL*8 RTOL(NVAR)
      COMMON /GDATA_t/ RTOL
! STEPMIN - Lower bound for integration step                       
      REAL*8 STEPMIN
      COMMON /GDATA_t/ STEPMIN
! STEPMAX - Upper bound for integration step                       
      REAL*8 STEPMAX
      COMMON /GDATA_t/ STEPMAX
! SPC_NAMES - Names of chemical species                            
      CHARACTER*32 SPC_NAMES(424)
      COMMON /CHARGDATA_t/ SPC_NAMES
! EQN_NAMES - Equation names                                       
      CHARACTER*100 EQN_NAMES(1627)
      COMMON /CHARGDATA_t/ EQN_NAMES

! INLINED global variable declarations                             

! IMPORTANT: this file must comply with both F77 and F90 standards
!   - comment lines MUST start with an exclamation mark "!", not a "c" or "C"
!   - continuation lines MUST begin with an ampersand "&" in 6-th position, and the
!     previous line MUST end with an ampersand placed after the 72-nd position
!     (for homogeneity, please always use the 73-rd position)

! photolysis common block
      !  (if updated here, other *.def files for KPP and global param must be updated as well)
      integer, parameter :: nphrxn = 47
      common /ph_r_t/ ph_rat(nphrxn)
      double precision ph_rat

! conversion factors
      double precision conv1,cvv1,cvv2,cvv3,cvv4,xhal,xiod,              &
     &       xliq1,xliq2,xliq3,xliq4,                                    &
     &       xhet1,xhet2,                                                &
     &       ykmt_OHClm,ycw,ycwd,yhenry,ykeb,ykef,yxkmt,yxkmtd,yxeq
!     common /kpp_rate_t/ conv1,cvv1,cvv2,cvv3,cvv4,xhal,xiod,xliq1,     & ! jjb original version
!    &   xliq2,xliq3,xliq4,ycw(4),yhenry(NSPEC),yxkmt(NSPEC,4),          &
!    &   ykef(NSPEC,4),ykeb(NSPEC,4)
!     common /kpp_rate_t/ conv1,cvv1,cvv2,cvv3,cvv4,xhal,xiod,xliq1,     & ! jjb updated Forcheck #20
!    &   xliq2,xliq3,xliq4,ycw(4),yhenry(NSPEC),yxkmt(NSPEC,4),          &
!    &   ykef(NSPEC,4),ykeb(NSPEC,4),xhet1,xhet2
      common /kpp_rate_t/ conv1,cvv1,cvv2,cvv3,cvv4,xhal,xiod,xliq1,     & ! jjb updated ...
     &   xliq2,xliq3,xliq4,ycw(4),yhenry(NSPEC),yxkmt(NSPEC,4),          &
     &   ykef(NSPEC,4),ykeb(NSPEC,4),xhet1,xhet2,yxkmtd(NSPEC,2),        &
     &   yxeq(NSPEC),ycwd(2)
      common /k_surf_t/ ykmt_OHClm(4)


! INLINED global variable declarations                             

