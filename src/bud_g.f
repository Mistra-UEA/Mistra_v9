!
! Copyright 1996-2017 the Authors
!
! Licensed under the EUPL, Version 1.1 only (the "Licence");
!
! You may not use this work except in compliance with the Licence.
! You may obtain a copy of the Licence at:
!   https://joinup.ec.europa.eu/software/page/eupl
!
! Unless required by applicable law or agreed to in writing,
! software distributed under the Licence is distributed on an
! "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
! either express or implied.
!
! See the Licence for the specific language governing permissions
! and limitations under the Licence.

      subroutine bud_gas (dtg,kl)
!
! Description:
!   gas phase chemical reactions budget
!
! Author:
!         Roland von Glasow, Josue Bock
!
! History:
! Version   Date     Comment
! -------   ----     -------
! 1.1      08/2016   Header, implicit none                          <Josue Bock>
!                    Call in gas_drive changed to include the
!                       if(kl.eq.k) test (itself improved)
!                    Reindexed bg array for CPU efficiency
!                    Cleaning
!
! 1.0       ?        Original code.                                 <Roland von Glasow>
!
! Code Description:
!   Language:          Fortran 77 (with Fortran 90 features)
!
! Declarations:
      USE global_params, ONLY:
     &     nlev,
     &     nrxn

      implicit none

! Include statements:
      include 'gas_Parameters.h' ! KPP parameters, needed for KPP common blocks declarations
      include 'gas_Global.h'     ! KPP common blocks including rate constants and concentrations

! Subroutine arguments
! Scalar arguments with intent(in):
      double precision dtg
      integer kl

! Local scalars:
      integer i

! Common blocks:
      common /budg/ bg(2,nrxn,nlev),il(nlev)
      double precision bg ! reaction rates (bg(1,:,:): instantaneous, bg(2,:,:): cumulative) [mol/(m^3*s)]
      integer il          ! indexes of the selected levels for reaction rates output         []

!- End of header ---------------------------------------------------------------

! rates (mol/(m^3*s)
      bg(1,1,kl) = RCONST(1)*VAR(38)*FIX(1)
      bg(1,2,kl) = RCONST(2)*VAR(38)*VAR(94)
      bg(1,3,kl) = RCONST(3)*VAR(38)*FIX(3)
      bg(1,4,kl) = RCONST(4)*VAR(38)*FIX(2)
      bg(1,5,kl) = RCONST(5)*VAR(38)*VAR(50)
      bg(1,6,kl) = RCONST(6)*VAR(67)*VAR(90)
      bg(1,7,kl) = RCONST(7)*VAR(90)*FIX(1)*FIX(1)
      bg(1,8,kl) = RCONST(8)*VAR(90)*VAR(94)
      bg(1,9,kl) = RCONST(9)*VAR(90)*FIX(1)*FIX(3)
      bg(1,10,kl) = RCONST(10)*VAR(94)*VAR(98)
      bg(1,11,kl) = RCONST(11)*VAR(98)*VAR(102)
      bg(1,12,kl) = RCONST(12)*VAR(50)*VAR(98)
      bg(1,13,kl) = RCONST(13)*VAR(67)*VAR(98)
      bg(1,14,kl) = RCONST(14)*VAR(98)*VAR(98)
      bg(1,15,kl) = RCONST(15)*VAR(98)*VAR(98)
      bg(1,16,kl) = RCONST(16)*VAR(94)*VAR(102)
      bg(1,17,kl) = RCONST(17)*VAR(102)*VAR(102)
      bg(1,18,kl) = RCONST(18)*VAR(94)
      bg(1,19,kl) = RCONST(19)*VAR(94)
      bg(1,20,kl) = RCONST(20)*VAR(67)
      bg(1,21,kl) = RCONST(21)*VAR(90)*VAR(93)
      bg(1,22,kl) = RCONST(22)*VAR(93)*VAR(98)
      bg(1,23,kl) = RCONST(23)*VAR(93)*VAR(102)
      bg(1,24,kl) = RCONST(24)*VAR(93)*VAR(94)
      bg(1,25,kl) = RCONST(25)*VAR(93)*VAR(95)
      bg(1,26,kl) = RCONST(26)*VAR(90)*VAR(91)
      bg(1,27,kl) = RCONST(27)*VAR(90)*VAR(91)
      bg(1,28,kl) = RCONST(28)*VAR(91)*VAR(98)
      bg(1,29,kl) = RCONST(29)*VAR(91)*VAR(102)
      bg(1,30,kl) = RCONST(30)*VAR(91)*VAR(94)
      bg(1,31,kl) = RCONST(31)*VAR(91)*VAR(95)
      bg(1,32,kl) = RCONST(32)*VAR(91)
      bg(1,33,kl) = RCONST(33)*VAR(90)*VAR(95)
      bg(1,34,kl) = RCONST(34)*VAR(95)*VAR(98)
      bg(1,35,kl) = RCONST(35)*VAR(95)*VAR(102)
      bg(1,36,kl) = RCONST(36)*VAR(95)*VAR(95)
      bg(1,37,kl) = RCONST(37)*VAR(95)
      bg(1,38,kl) = RCONST(38)*VAR(95)
      bg(1,39,kl) = RCONST(39)*VAR(32)
      bg(1,40,kl) = RCONST(40)*VAR(32)
      bg(1,41,kl) = RCONST(41)*VAR(28)*VAR(98)
      bg(1,42,kl) = RCONST(42)*VAR(28)
      bg(1,43,kl) = RCONST(43)*VAR(75)*VAR(98)
      bg(1,44,kl) = RCONST(44)*VAR(75)
      bg(1,45,kl) = RCONST(45)*VAR(41)
      bg(1,46,kl) = RCONST(46)*VAR(41)*VAR(98)
      bg(1,47,kl) = RCONST(47)*VAR(41)
      bg(1,48,kl) = RCONST(48)*VAR(41)
      bg(1,49,kl) = RCONST(49)*VAR(24)*VAR(98)
      bg(1,50,kl) = RCONST(50)*VAR(49)*VAR(98)
      bg(1,51,kl) = RCONST(51)*VAR(34)*VAR(98)
      bg(1,52,kl) = RCONST(52)*VAR(35)*VAR(98)
      bg(1,53,kl) = RCONST(53)*VAR(76)*VAR(98)
      bg(1,54,kl) = RCONST(54)*VAR(76)*VAR(94)
      bg(1,55,kl) = RCONST(55)*VAR(76)*VAR(95)
      bg(1,56,kl) = RCONST(56)*VAR(23)*FIX(2)
      bg(1,57,kl) = RCONST(57)*VAR(93)*VAR(100)
      bg(1,58,kl) = RCONST(58)*VAR(100)*VAR(102)
      bg(1,59,kl) = RCONST(59)*VAR(100)*VAR(100)
      bg(1,60,kl) = RCONST(60)*VAR(100)*VAR(100)
      bg(1,61,kl) = RCONST(61)*VAR(71)*VAR(93)
      bg(1,62,kl) = RCONST(62)*VAR(71)*VAR(102)
      bg(1,63,kl) = RCONST(63)*VAR(71)*VAR(71)
      bg(1,64,kl) = RCONST(64)*VAR(71)*VAR(71)
      bg(1,65,kl) = RCONST(65)*VAR(71)*VAR(100)
      bg(1,66,kl) = RCONST(66)*VAR(71)*VAR(100)
      bg(1,67,kl) = RCONST(67)*VAR(71)*VAR(100)
      bg(1,68,kl) = RCONST(68)*VAR(73)*VAR(93)
      bg(1,69,kl) = RCONST(69)*VAR(73)*VAR(93)
      bg(1,70,kl) = RCONST(70)*VAR(73)*VAR(102)
      bg(1,71,kl) = RCONST(71)*VAR(73)*VAR(73)
      bg(1,72,kl) = RCONST(72)*VAR(73)*VAR(73)
      bg(1,73,kl) = RCONST(73)*VAR(73)*VAR(100)
      bg(1,74,kl) = RCONST(74)*VAR(73)*VAR(100)
      bg(1,75,kl) = RCONST(75)*VAR(73)*VAR(100)
      bg(1,76,kl) = RCONST(76)*VAR(82)*VAR(93)
      bg(1,77,kl) = RCONST(77)*VAR(82)*VAR(102)
      bg(1,78,kl) = RCONST(78)*VAR(82)*VAR(82)
      bg(1,79,kl) = RCONST(79)*VAR(82)*VAR(100)
      bg(1,80,kl) = RCONST(80)*VAR(82)*VAR(100)
      bg(1,81,kl) = RCONST(81)*VAR(82)*VAR(91)
      bg(1,82,kl) = RCONST(82)*VAR(57)
      bg(1,83,kl) = RCONST(83)*VAR(57)*VAR(98)
      bg(1,84,kl) = RCONST(84)*VAR(88)*VAR(98)
      bg(1,85,kl) = RCONST(85)*VAR(88)*VAR(95)
      bg(1,86,kl) = RCONST(86)*VAR(88)
      bg(1,87,kl) = RCONST(87)*VAR(88)
      bg(1,88,kl) = RCONST(88)*VAR(79)*VAR(98)
      bg(1,89,kl) = RCONST(89)*VAR(79)*VAR(95)
      bg(1,90,kl) = RCONST(90)*VAR(79)
      bg(1,91,kl) = RCONST(91)*VAR(56)*VAR(98)
      bg(1,92,kl) = RCONST(92)*VAR(60)*VAR(98)
      bg(1,93,kl) = RCONST(93)*VAR(60)*VAR(98)
      bg(1,94,kl) = RCONST(94)*VAR(54)*VAR(98)
      bg(1,95,kl) = RCONST(95)*VAR(48)*VAR(98)
      bg(1,96,kl) = RCONST(96)*VAR(78)*VAR(98)
      bg(1,97,kl) = RCONST(97)*VAR(78)*VAR(98)
      bg(1,98,kl) = RCONST(98)*VAR(78)
      bg(1,99,kl) = RCONST(99)*VAR(52)*VAR(90)
      bg(1,100,kl) = RCONST(100)*VAR(52)*VAR(98)
      bg(1,101,kl) = RCONST(101)*VAR(52)*VAR(94)
      bg(1,102,kl) = RCONST(102)*VAR(25)*FIX(1)
      bg(1,103,kl) = RCONST(103)*VAR(26)
      bg(1,104,kl) = RCONST(104)*VAR(24)*VAR(26)
      bg(1,105,kl) = RCONST(105)*VAR(87)*VAR(98)
      bg(1,106,kl) = RCONST(106)*VAR(87)*VAR(98)
      bg(1,107,kl) = RCONST(107)*VAR(87)*VAR(95)
      bg(1,108,kl) = RCONST(108)*VAR(87)*VAR(99)
      bg(1,109,kl) = RCONST(109)*VAR(87)*VAR(97)
      bg(1,110,kl) = RCONST(110)*VAR(87)*VAR(96)
      bg(1,111,kl) = RCONST(111)*VAR(87)*VAR(92)
      bg(1,112,kl) = RCONST(112)*VAR(87)*VAR(101)
      bg(1,113,kl) = RCONST(113)*VAR(86)*VAR(93)
      bg(1,114,kl) = RCONST(114)*VAR(86)*VAR(102)
      bg(1,115,kl) = RCONST(115)*VAR(86)*VAR(86)
      bg(1,116,kl) = RCONST(116)*VAR(86)*VAR(100)
      bg(1,117,kl) = RCONST(117)*VAR(86)*VAR(91)
      bg(1,118,kl) = RCONST(118)*VAR(61)*VAR(94)
      bg(1,119,kl) = RCONST(119)*VAR(61)*VAR(91)
      bg(1,120,kl) = RCONST(120)*VAR(61)*VAR(91)
      bg(1,121,kl) = RCONST(121)*VAR(61)*VAR(93)
      bg(1,122,kl) = RCONST(122)*VAR(61)*VAR(93)
      bg(1,123,kl) = RCONST(123)*VAR(84)*VAR(94)
      bg(1,124,kl) = RCONST(124)*VAR(84)*VAR(91)
      bg(1,125,kl) = RCONST(125)*VAR(84)*VAR(91)
      bg(1,126,kl) = RCONST(126)*VAR(85)
      bg(1,127,kl) = RCONST(127)*VAR(85)*VAR(94)
      bg(1,128,kl) = RCONST(128)*VAR(85)*VAR(91)
      bg(1,129,kl) = RCONST(129)*VAR(85)*VAR(91)
      bg(1,130,kl) = RCONST(130)*VAR(85)*VAR(93)
      bg(1,131,kl) = RCONST(131)*VAR(27)*VAR(102)
      bg(1,132,kl) = RCONST(132)*VAR(39)*VAR(98)
      bg(1,133,kl) = RCONST(133)*VAR(39)
      bg(1,134,kl) = RCONST(134)*VAR(33)
      bg(1,135,kl) = RCONST(135)*VAR(77)*VAR(98)
      bg(1,136,kl) = RCONST(136)*VAR(77)*VAR(99)
      bg(1,137,kl) = RCONST(137)*VAR(77)*VAR(92)
      bg(1,138,kl) = RCONST(138)*VAR(42)*VAR(98)
      bg(1,139,kl) = RCONST(139)*VAR(42)*VAR(95)
      bg(1,140,kl) = RCONST(140)*VAR(94)*VAR(99)
      bg(1,141,kl) = RCONST(141)*VAR(99)*VAR(102)
      bg(1,142,kl) = RCONST(142)*VAR(99)*VAR(102)
      bg(1,143,kl) = RCONST(143)*VAR(67)*VAR(99)
      bg(1,144,kl) = RCONST(144)*VAR(50)*VAR(99)
      bg(1,145,kl) = RCONST(145)*VAR(75)*VAR(99)
      bg(1,146,kl) = RCONST(146)*VAR(91)*VAR(99)
      bg(1,147,kl) = RCONST(147)*VAR(91)*VAR(99)
      bg(1,148,kl) = RCONST(148)*VAR(95)*VAR(99)
      bg(1,149,kl) = RCONST(149)*VAR(72)*VAR(98)
      bg(1,150,kl) = RCONST(150)*VAR(72)
      bg(1,151,kl) = RCONST(151)*VAR(90)*VAR(96)
      bg(1,152,kl) = RCONST(152)*VAR(96)*VAR(98)
      bg(1,153,kl) = RCONST(153)*VAR(96)*VAR(98)
      bg(1,154,kl) = RCONST(154)*VAR(96)*VAR(102)
      bg(1,155,kl) = RCONST(155)*VAR(94)*VAR(96)
      bg(1,156,kl) = RCONST(156)*VAR(94)*VAR(96)
      bg(1,157,kl) = RCONST(157)*VAR(93)*VAR(96)
      bg(1,158,kl) = RCONST(158)*VAR(91)*VAR(96)
      bg(1,159,kl) = RCONST(159)*VAR(95)*VAR(96)
      bg(1,160,kl) = RCONST(160)*VAR(95)*VAR(96)
      bg(1,161,kl) = RCONST(161)*VAR(96)*VAR(96)
      bg(1,162,kl) = RCONST(162)*VAR(96)*VAR(96)
      bg(1,163,kl) = RCONST(163)*VAR(96)*VAR(96)
      bg(1,164,kl) = RCONST(164)*VAR(96)*VAR(96)
      bg(1,165,kl) = RCONST(165)*VAR(83)*VAR(96)
      bg(1,166,kl) = RCONST(166)*VAR(83)*VAR(99)
      bg(1,167,kl) = RCONST(167)*VAR(83)*VAR(90)
      bg(1,168,kl) = RCONST(168)*VAR(83)*VAR(90)
      bg(1,169,kl) = RCONST(169)*VAR(83)*VAR(98)
      bg(1,170,kl) = RCONST(170)*VAR(83)*VAR(94)
      bg(1,171,kl) = RCONST(171)*VAR(83)*VAR(93)
      bg(1,172,kl) = RCONST(172)*VAR(83)
      bg(1,173,kl) = RCONST(173)*VAR(53)*VAR(99)
      bg(1,174,kl) = RCONST(174)*VAR(53)*VAR(94)
      bg(1,175,kl) = RCONST(175)*VAR(53)
      bg(1,176,kl) = RCONST(176)*VAR(53)
      bg(1,177,kl) = RCONST(177)*VAR(21)
      bg(1,178,kl) = RCONST(178)*VAR(66)*VAR(98)
      bg(1,179,kl) = RCONST(179)*VAR(62)*VAR(90)
      bg(1,180,kl) = RCONST(180)*VAR(62)*VAR(98)
      bg(1,181,kl) = RCONST(181)*VAR(62)
      bg(1,182,kl) = RCONST(182)*VAR(40)*VAR(98)
      bg(1,183,kl) = RCONST(183)*VAR(40)
      bg(1,184,kl) = RCONST(184)*VAR(63)*VAR(99)
      bg(1,185,kl) = RCONST(185)*VAR(63)*VAR(90)
      bg(1,186,kl) = RCONST(186)*VAR(63)*VAR(98)
      bg(1,187,kl) = RCONST(187)*VAR(63)
      bg(1,188,kl) = RCONST(188)*VAR(63)
      bg(1,189,kl) = RCONST(189)*VAR(34)*VAR(99)
      bg(1,190,kl) = RCONST(190)*VAR(35)*VAR(99)
      bg(1,191,kl) = RCONST(191)*VAR(76)*VAR(99)
      bg(1,192,kl) = RCONST(192)*VAR(88)*VAR(99)
      bg(1,193,kl) = RCONST(193)*VAR(79)*VAR(99)
      bg(1,194,kl) = RCONST(194)*VAR(56)*VAR(99)
      bg(1,195,kl) = RCONST(195)*VAR(60)*VAR(99)
      bg(1,196,kl) = RCONST(196)*VAR(78)*VAR(99)
      bg(1,197,kl) = RCONST(197)*VAR(54)*VAR(99)
      bg(1,198,kl) = RCONST(198)*VAR(48)*VAR(99)
      bg(1,199,kl) = RCONST(199)*VAR(57)*VAR(99)
      bg(1,200,kl) = RCONST(200)*VAR(99)*VAR(100)
      bg(1,201,kl) = RCONST(201)*VAR(96)*VAR(100)
      bg(1,202,kl) = RCONST(202)*VAR(37)*VAR(98)
      bg(1,203,kl) = RCONST(203)*VAR(65)*VAR(93)
      bg(1,204,kl) = RCONST(204)*VAR(65)*VAR(102)
      bg(1,205,kl) = RCONST(205)*VAR(65)*VAR(65)
      bg(1,206,kl) = RCONST(206)*VAR(65)*VAR(100)
      bg(1,207,kl) = RCONST(207)*VAR(94)*VAR(97)
      bg(1,208,kl) = RCONST(208)*VAR(97)*VAR(102)
      bg(1,209,kl) = RCONST(209)*VAR(67)*VAR(97)
      bg(1,210,kl) = RCONST(210)*VAR(91)*VAR(97)
      bg(1,211,kl) = RCONST(211)*VAR(95)*VAR(97)
      bg(1,212,kl) = RCONST(212)*VAR(74)*VAR(98)
      bg(1,213,kl) = RCONST(213)*VAR(74)*VAR(90)
      bg(1,214,kl) = RCONST(214)*VAR(74)
      bg(1,215,kl) = RCONST(215)*VAR(92)*VAR(97)
      bg(1,216,kl) = RCONST(216)*VAR(90)*VAR(92)
      bg(1,217,kl) = RCONST(217)*VAR(92)*VAR(98)
      bg(1,218,kl) = RCONST(218)*VAR(92)*VAR(102)
      bg(1,219,kl) = RCONST(219)*VAR(92)*VAR(93)
      bg(1,220,kl) = RCONST(220)*VAR(91)*VAR(92)
      bg(1,221,kl) = RCONST(221)*VAR(92)*VAR(95)
      bg(1,222,kl) = RCONST(222)*VAR(92)*VAR(94)
      bg(1,223,kl) = RCONST(223)*VAR(92)*VAR(92)
      bg(1,224,kl) = RCONST(224)*VAR(92)*VAR(92)
      bg(1,225,kl) = RCONST(225)*VAR(92)
      bg(1,226,kl) = RCONST(226)*VAR(29)*VAR(97)
      bg(1,227,kl) = RCONST(227)*VAR(64)*VAR(98)
      bg(1,228,kl) = RCONST(228)*VAR(64)*VAR(95)
      bg(1,229,kl) = RCONST(229)*VAR(68)*VAR(90)
      bg(1,230,kl) = RCONST(230)*VAR(68)
      bg(1,231,kl) = RCONST(231)*VAR(22)
      bg(1,232,kl) = RCONST(232)*VAR(51)*VAR(90)
      bg(1,233,kl) = RCONST(233)*VAR(51)*VAR(97)
      bg(1,234,kl) = RCONST(234)*VAR(51)
      bg(1,235,kl) = RCONST(235)*VAR(51)
      bg(1,236,kl) = RCONST(236)*VAR(76)*VAR(97)
      bg(1,237,kl) = RCONST(237)*VAR(88)*VAR(97)
      bg(1,238,kl) = RCONST(238)*VAR(79)*VAR(97)
      bg(1,239,kl) = RCONST(239)*VAR(78)*VAR(97)
      bg(1,240,kl) = RCONST(240)*VAR(97)*VAR(100)
      bg(1,241,kl) = RCONST(241)*VAR(88)*VAR(92)
      bg(1,242,kl) = RCONST(242)*VAR(92)*VAR(100)
      bg(1,243,kl) = RCONST(243)*VAR(92)*VAR(100)
      bg(1,244,kl) = RCONST(244)*VAR(31)*VAR(98)
      bg(1,245,kl) = RCONST(245)*VAR(70)*VAR(93)
      bg(1,246,kl) = RCONST(246)*VAR(70)*VAR(102)
      bg(1,247,kl) = RCONST(247)*VAR(70)*VAR(70)
      bg(1,248,kl) = RCONST(248)*VAR(70)*VAR(100)
      bg(1,249,kl) = RCONST(249)*VAR(89)*VAR(94)
      bg(1,250,kl) = RCONST(250)*VAR(89)*VAR(102)
      bg(1,251,kl) = RCONST(251)*VAR(89)*VAR(91)
      bg(1,252,kl) = RCONST(252)*VAR(89)*VAR(95)
      bg(1,253,kl) = RCONST(253)*VAR(89)*VAR(89)
      bg(1,254,kl) = RCONST(254)*VAR(81)*VAR(90)
      bg(1,255,kl) = RCONST(255)*VAR(81)*VAR(98)
      bg(1,256,kl) = RCONST(256)*VAR(81)*VAR(95)
      bg(1,257,kl) = RCONST(257)*VAR(81)
      bg(1,258,kl) = RCONST(258)*VAR(90)*VAR(101)
      bg(1,259,kl) = RCONST(259)*VAR(101)*VAR(102)
      bg(1,260,kl) = RCONST(260)*VAR(93)*VAR(101)
      bg(1,261,kl) = RCONST(261)*VAR(91)*VAR(101)
      bg(1,262,kl) = RCONST(262)*VAR(101)*VAR(101)
      bg(1,263,kl) = RCONST(263)*VAR(101)
      bg(1,264,kl) = RCONST(264)*VAR(55)*VAR(98)
      bg(1,265,kl) = RCONST(265)*VAR(55)*VAR(93)
      bg(1,266,kl) = RCONST(266)*VAR(55)*VAR(55)
      bg(1,267,kl) = RCONST(267)*VAR(55)
      bg(1,268,kl) = RCONST(268)*VAR(20)
      bg(1,269,kl) = RCONST(269)*VAR(43)*VAR(98)
      bg(1,270,kl) = RCONST(270)*VAR(43)*VAR(95)
      bg(1,271,kl) = RCONST(271)*VAR(36)
      bg(1,272,kl) = RCONST(272)*VAR(30)*VAR(30)
      bg(1,273,kl) = RCONST(273)*VAR(30)
      bg(1,274,kl) = RCONST(274)*VAR(44)
      bg(1,275,kl) = RCONST(275)*VAR(44)
      bg(1,276,kl) = RCONST(276)*VAR(1)
      bg(1,277,kl) = RCONST(277)*VAR(45)*VAR(98)
      bg(1,278,kl) = RCONST(278)*VAR(45)
      bg(1,279,kl) = RCONST(279)*VAR(47)*VAR(98)
      bg(1,280,kl) = RCONST(280)*VAR(47)
      bg(1,281,kl) = RCONST(281)*VAR(46)*VAR(98)
      bg(1,282,kl) = RCONST(282)*VAR(46)
      bg(1,283,kl) = RCONST(283)*VAR(100)*VAR(101)
      bg(1,284,kl) = RCONST(284)*VAR(59)*VAR(93)
      bg(1,285,kl) = RCONST(285)*VAR(59)*VAR(102)
      bg(1,286,kl) = RCONST(286)*VAR(59)*VAR(59)
      bg(1,287,kl) = RCONST(287)*VAR(59)*VAR(100)
      bg(1,288,kl) = RCONST(288)*VAR(80)*VAR(99)
      bg(1,289,kl) = RCONST(289)*VAR(74)*VAR(99)
      bg(1,290,kl) = RCONST(290)*VAR(81)*VAR(99)
      bg(1,291,kl) = RCONST(291)*VAR(99)*VAR(101)
      bg(1,292,kl) = RCONST(292)*VAR(83)*VAR(97)
      bg(1,293,kl) = RCONST(293)*VAR(72)*VAR(97)
      bg(1,294,kl) = RCONST(294)*VAR(53)*VAR(97)
      bg(1,295,kl) = RCONST(295)*VAR(80)*VAR(97)
      bg(1,296,kl) = RCONST(296)*VAR(81)*VAR(97)
      bg(1,297,kl) = RCONST(297)*VAR(97)*VAR(101)
      bg(1,298,kl) = RCONST(298)*VAR(58)*VAR(97)
      bg(1,299,kl) = RCONST(299)*VAR(74)*VAR(89)
      bg(1,300,kl) = RCONST(300)*VAR(89)*VAR(92)
      bg(1,301,kl) = RCONST(301)*VAR(81)*VAR(92)
      bg(1,302,kl) = RCONST(302)*VAR(92)*VAR(96)
      bg(1,303,kl) = RCONST(303)*VAR(92)*VAR(96)
      bg(1,304,kl) = RCONST(304)*VAR(92)*VAR(96)
      bg(1,305,kl) = RCONST(305)*VAR(96)*VAR(101)
      bg(1,306,kl) = RCONST(306)*VAR(96)*VAR(101)
      bg(1,307,kl) = RCONST(307)*VAR(96)*VAR(101)
      bg(1,308,kl) = RCONST(308)*VAR(92)*VAR(101)
      bg(1,309,kl) = RCONST(309)*VAR(92)*VAR(101)
      bg(1,310,kl) = RCONST(310)*VAR(58)*VAR(98)
      bg(1,311,kl) = RCONST(311)*VAR(58)
      bg(1,312,kl) = RCONST(312)*VAR(69)*VAR(97)
      bg(1,313,kl) = RCONST(313)*VAR(69)*VAR(99)
      bg(1,314,kl) = RCONST(314)*VAR(69)*VAR(98)
      bg(1,315,kl) = RCONST(315)*VAR(69)
      bg(1,316,kl) = RCONST(316)*VAR(80)*VAR(90)
      bg(1,317,kl) = RCONST(317)*VAR(80)*VAR(98)
      bg(1,318,kl) = RCONST(318)*VAR(80)
      bg(1,319,kl) = RCONST(319)*VAR(45)*VAR(99)
      bg(1,320,kl) = RCONST(320)*VAR(47)*VAR(99)
      bg(1,321,kl) = RCONST(321)*VAR(46)*VAR(99)
      bg(1,322,kl) = RCONST(322)*VAR(3)
      bg(1,323,kl) = RCONST(323)*VAR(2)
      bg(1,324,kl) = RCONST(324)*VAR(75)
      bg(1,325,kl) = RCONST(325)*VAR(32)
      bg(1,326,kl) = RCONST(326)*VAR(24)
      bg(1,327,kl) = RCONST(327)*VAR(19)
      bg(1,328,kl) = RCONST(328)*VAR(75)
      bg(1,329,kl) = RCONST(329)*VAR(32)
      bg(1,330,kl) = RCONST(330)*VAR(24)
      bg(1,331,kl) = RCONST(331)*VAR(19)
c accumulated rates (mlc/cm^3)
      do i=1,331
         bg(2,i,kl)=bg(2,i,kl)+dtg*bg(1,i,kl)
      end do
      return
      end
