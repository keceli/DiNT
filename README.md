# DiNT
## Direct Nonadiabatic Trajectories v2.0: A code for non-Born--Oppenheimer molecular dynamics

This is the development version of DiNT included with the AutoMech suite: [AutoMech](https://github.com/Auto-Mech/DiNT)

A stable release download of DiNT v2.0 is available at: [UMN](https://comp.chem.umn.edu/dint/)

Manual in PDF format: [Manual](https://comp.chem.umn.edu/dint/Dint_v2.0_manual.pdf)

## Authors
DiNT v1.0 (Jul 4 2013): Ahren W. Jasper, C. Melania Oana, and Donald G. Truhlar\
DiNT v2.0 (Dec 10 2020): Ahren W. Jasper, Rui Ming Zhang, and Donald G. Truhlar

## Functionality
DiNT is a parallel Fortran computer program for performing classical and semiclassical trajectory simulations of electronically adiabatic and nonadiabatic processes.
DiNT - version 2.0 can be used for dynamics governed either by a single potential energy surface (electronically adiabatic processes) or by two or more coupled potential energy surfaces (electronically nonadiabatic processes).
DiNT - version 2.0 can handle reactive trajectories, bimolecular inelastic collisions, and unimolecular processes.
DiNT - version 2.0 can be run at fixed energy or for thermal ensembles.

## Preferred citations for this code
 1. A. W. Jasper, C. M. Oana, and D. G. Truhlar, DiNT, July 2013.
 2. A. W. Jasper and D. G. Truhlar, "Non-Born–Oppenheimer molecular dynamics for conical intersections, avoided crossings, and weak interactions," in Conical Intersections: Theory, Computation, and Experiment, edited by W. Domcke, D. R. Yarkony, and H. Koppel (World Scientific, 2011), pp. 375-412 (chp. 10) or Adv. Ser. Phys. Chem. 17, 375-412 (2011).
    
## Install
  ```console
  user@login:$ cd src/
  user@login:$ make
  ```
