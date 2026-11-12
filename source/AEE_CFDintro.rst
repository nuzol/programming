Computational Fluid Dynamics (CFD)
==========================================

.. toctree::
   :caption: CFD
   :maxdepth: 2


Computational Fluid Dynamics (CFD) is a science of fluid dynamics in which numerical methods and algorithms are used for the analysis and solution of fluid dynamics problems (fluid mechanics and heat transfer problems). The interactions of liquids and gases with solid surfaces and the flow fields around and/or inside these solid bodies are solved with the help of computers. The accuracy of CFD simulations depends on the mathematical model and numerical methods used. Mostly, CFD simulations are done using parallel computers.

**Hesaplamalı Akışkanlar Dinamiği (HAD)**

*Hesaplamalı Akışkanlar Dinamiği (HAD), akışkanlar dinamiği problemlerinin (akışkanlar mekaniği ve ısı transferi problemlerinin) analizi ve çözümlenmesi için sayısal yöntem ve algoritmaların kullanıldığı bir akışkanlar dinamiği bilimi dalıdır. Sıvı ve gazların katı yüzeyler ile etkileşimleri ve bu katı cisimlerin etrafındaki ve/veya içindeki akış alanları bilgisayar yardımı ile çözülür. HAD simülasyonlarının doğruluğu kullanılan matematiksel model ve sayısal yöntemlere bağlıdır. Çoğunlukla, paralel bilgisayarlar kullanılarak HAD simülasyonları yapılır.*


----------

**CFD Simulation Steps (Hesaplamalı Akışkanlar Dinamiği Simülasyon Adımları)**

* Pre-processing Steps (Ön-işlem Adımları)
	* Solid Modelling (Geometri Tanımı ve Katı Modelleme)
	* Grid Generation (Çözüm Ağı Oluşturma)
	* Domain Decomposition (Çözüm Ağı Bölünme)
* Computations with Flow Solver (Akış Çözücü ile Hesaplamalar)
	* CFD Computations (HAD Simülasyonları)
* Post-processing Steps (Art-işlem Adımları)
	* Evaluation of Computational Results (Hesaplama sonuçlarının değerlendirilmesi)
	* Visualization (Görüntüleme)

.. figure:: refs/CFDSteps.pdf
    :align: center
    :figwidth: 600px

    Figure 1. CFD Simulation Steps (HAD Simülasyon Adımları)


----------

**Fluid Dynamics Governing Equations (Akışkanlar Dinamiği Temel Denklemleri)**

The governing equations for fluid dynamics are listed as follows, from the fundamental governing equations to the simplified equations with various assumptions:

*En temel denklemlerden çeşitli varsayımlarla basitleştirilmiş denklemlere akışkanlar dinamiği temel denklemleri (governing equations) aşağıdaki gibi sıralanabilir.*

* Boltzmann Equations
* Navier Stokes Equations
* Euler Equations
* Full Potential Equations (Tam Potansiyel Denklemi)
* Prandtl-Glauert Equation / Wave Equation (Dalga Denklemi)
* Potential Equation / Laplace Equation (Potansiyel Denklemi)

.. figure:: refs/CFDEqns.pdf
    :align: center
    :figwidth: 600px

    Figure 2. Fluid Dynamics Governing Equations (Akışkanlar Dinamiği Temel Denklemleri)


----------

**CFD Simulations (HAD Simülasyonları)**

In Computational Fluid Dynamics (CFD) simulations, the flow fields can have the following properties:

* 2-D / 3-D
* Steady-State / Unsteady
* Rarefied / Continuum
* Inviscid / Viscous
* Rotational / Irrotational
* Incompressible / Compressible
* Linear / Nonlinear

*Hesaplamalı Akışkanlar Dinamiği (HAD) simülasyonlarında, çözülen akışlar aşağıdaki özelliklere sahip olabilirler:*

* *2-boyutlu (2-D) / 3-boyutlu (3-D) / 4-boyutlu: 3-boyutlu ve zamana bağlı (3-D and unsteady)*
* *Daimi (Steady-state) / Zamana bağlı (Unsteady)*
* *Seyreltilmiş (Rarefied) / Sürekli Ortam (Continuum)*
* *Viskoz olmayan (Inviscid) / Viskoz (Viscous)*
* *Dönmeli (Rotational) / Dönmesiz (Irrotational)*
* *Sıkıştırılamaz (Incompressible) / Sıkıştırılabilir (Compressible)*
* *Doğrusal (Linear) / Doğrusal olmayan (Nonlinear)*


----------

**Numerical Discretization Approaches (Sayısal Ayrıklaştırma Yöntemleri)**

Different numerical discretization approaches are used in flow solutions with CFD:

*Hesaplamalı Akışkanlar Dinamiği (HAD) ile akış çözümlerinde farklı sayısal ayrıklaştırma yöntemleri kullanılabilir:*

* Finite Difference Methods (Sonlu Farklar Yöntemleri)
* Finite Volume Methods (Sonlu Hacim Yöntemleri)
* Finite Element Methods (Sonlu Eleman Yöntemleri)
* Spectral Methods (Spektral Yöntemler)
* Meshless Methods (Ağsız Yöntemler)

**Numerical Methods - Approximate Solution Methods (Sayısal Yöntemler)**

Different numerical methods suitable for the problem are used in flow solutions with CFD:

*Hesaplamalı Akışkanlar Dinamiği (HAD) ile akış çözümlerinde probleme uygun farklı sayısal yöntemler kullanılır:*

* Time integration methods - Unsteady problem (Zamanda ilerleme yöntemleri - Zamana bağlı problem)
* Iteration methods - Steady state problem (Yinelemeli yöntemler - Daimi problem)
* Flux calculation methods - Finite Difference or Finite Volume (Akı hesaplama yöntemleri - Sonlu Fark veya Sonlu Hacim)

**Boundary Conditions (Sınır Koşulları)**

Different boundary conditions suitable for the problem are used in flow solutions with CFD:

*Hesaplamalı Akışkanlar Dinamiği (HAD) ile akış çözümlerinde probleme uygun farklı sınır koşulları kullanılır:*

* Wall Boundary Condition (Duvar Sınır Koşulu)
* Freestream Boundary Condition (Serbest Akış Sınır Koşulu)
* ...

**Initial Conditions (Başlangıç Koşulları)**

Different initial conditions suitable for the problem are used in flow solutions with CFD:

*Hesaplamalı Akışkanlar Dinamiği (HAD) ile akış çözümlerinde probleme uygun farklı başlangıç koşulları kullanılır:*

* Initial Flow Field Condition (Başlangıç Akış Alanı Koşulu)
* Initial Turbulence Conditions (Başlangıç Türbülans Koşulları)


----------

**Computational Grids (Çözüm Ağları) & Grid Generation (Çözüm Ağı Oluşturma)**

Different grids suitable with the problem and the numerical methods are generated in flow solutions with CFD:

*Hesaplamalı Akışkanlar Dinamiği (HAD) ile akış çözümlerinde probleme ve kullanılan sayısal yöntemlere uygun farklı çözüm ağları oluşturulur:*

* Structured Grids (Yapısal Çözüm Ağları)
	* O-type
	* H-type
	* C-type
	* C-H type
	* Multi-Block
* Unstructured Grids (Yapısal Olmayan Çözüm Ağları)
* Mixed Grids (Karışık/Hibrit Çözüm Ağları)
* Overset/Chimera Grids (Üstüste Çözüm Ağları)
* Meshless Methods (Ağsız Yöntemler)


----------

**Turbulence Modeling**

There are different turbulence models that are used according to the problem, the assumptions about the flow and the numerical methods used:

*Hesaplamalı Akışkanlar Dinamiği (HAD) ile akış çözümlerinde probleme, akış ile ilgili varsayımlara ve kullanılan sayısal yöntemlere uygun farklı türbülans modelleri kullanılır:*

* DNS - Direct Numerical Simulation (Doğrudan Sayısal Simülasyon)
* LES - Large Eddy Simulation (Büyük Girdap Simülasyonu)
	* SGS - Subgrid Scale Model (Alt-Ağ Ölçeği Modeli)
* RANS - Reynolds Averaged Navier Stokes (Reynolds-Ortalamalı Navier Stokes)
	* SA - Spalart-Allmaras
	* k-epsilon
	* k-omega
	* k-omega-SST
	* RSM - Reynolds Stress Modelling (Reynolds Gerilme Modelleme)

**Wall Functions (Duvar Fonksiyonları)**

Different wall functions are used to provide wall boundary layer conditions according to the problem, the assumptions about the flow, the numerical methods, the turbulence models and the grids used:

*Hesaplamalı Akışkanlar Dinamiği (HAD) ile akış çözümlerinde probleme, akış ile ilgili varsayımlara, kullanılan sayısal yöntemlere ve kullanılan türbülans modelleri ve çözüm ağlarına uygun duvar sınır koşullarını sağlamak için farklı duvar fonksiyonları kullanılır:*

* Log-Law Boundary Layer Model (Low-Yasası Sınır Tabaka Modeli)

**Transition Models (Geçiş Modelleri)**

For wing section/wing aerodynamic calculations, different boundary layer transition models are used in flow solutions with CFD according to the problem, the assumptions about the flow, the numerical methods and the turbulence models used:

*Kanat kesiti/kanat aerodinamik hesaplamaları için Hesaplamalı Akışkanlar Dinamiği (HAD) ile akış çözümlerinde probleme, akış ile ilgili varsayımlara, kullanılan sayısal yöntemlere ve kullanılan türbülans modellerine uygun farklı sınır tabaka geçiş modelleri kullanılır:*

* Langtry-Menter gamma-Re-theta Transition Model (Langtry-Menter gamma-Re-theta Geçiş Modeli)
* k-w-gamma Transition Model (k-w-theta Geçiş Modeli)
* SA-AFT transition Model (SA-AFT Geçiş Modeli)
* BC model


----------

Open Source CFD Codes
-------------------------------

* `OpenFOAM <https://www.openfoam.com>`_
* `SU2 <https://su2code.github.io>`_
* `CodeSaturne <https://www.code-saturne.org>`_
* `Basilisk <http://basilisk.fr>`_
* `NEKTAR++ <https://www.nektar.info>`_
* `OpenLB <https://www.openlb.net>`_


----------

Grid Generation Codes/Software
-------------------------------

* `Gmsh <https://gmsh.info>`_
* `Salome <https://www.salome-platform.org>`_


----------

Visualization Codes/Software
-------------------------------

* `Gnuplot <http://www.gnuplot.info>`_
* `Visit <https://hpc.llnl.gov/software/visualization-software/visit>`_
* `Paraview <https://www.paraview.org>`_
* `pgfplots <https://pgfplots.net>`_
* `Tecplot <https://www.tecplot.com>`_
* `Ensight <https://www.ensight.com>`_


----------

Training and Workshops
-------------------------------

* CFD Workshop: `TRUBA’da Hesaplamalı Akışkanlar Dinamiği (HAD, CFD) Simülasyonları [ONLINE] <https://indico.truba.gov.tr/event/255/>`_, March 18, 2026.
* CFD/Wind Energy Training: `METU RÜZGEM Training on “CFD and Performance Simulations of Wind Turbines” [ONLINE] <https://indico.truba.gov.tr/event/152/>`_, Dec 16, 2023.
* CFD/Wind Energy Workshop: `EuroCC Türkiye – METU RÜZGEM Workshop on Wind Energy Computational Analyses [ONLINE] <https://indico.truba.gov.tr/event/94/>`_, Sept 21, 2022.
* CFD Training: `High Performance CFD using OpenFOAM [ONLINE] <https://indico.truba.gov.tr/event/85/overview>`_, April 28, 2022.
* CFD Training: `EuroCC@Türkiye HAD Eğitim Serisi: 2 - OpenFOAM  [ONLINE] <https://indico.truba.gov.tr/event/67/>`_, March 24, 2022.
* CFD Training: `EuroCC@Türkiye HAD Eğitim Serisi: 1 - Code_Saturne Yazılımı ile Uygulamalar [ONLINE] <https://indico.truba.gov.tr/event/66/>`_, Jan 13-14, 2022.
* CFD Summer School: `EuroCC@Türkiye Hesaplamalı Akışkanlar Dinamiği Yaz Okulu [ONLINE] <https://indico.truba.gov.tr/event/44/>`_, Aug 9-10, 2021.
* HPC/CFD Winter School: `EuroCC@Turkey Kış Okulu [ONLINE] <https://indico.truba.gov.tr/event/6/>`_ (Hesaplamalı Akışkanlar Dinamiği'ne Giriş ve Aerodinamik Simülasyonlar, Dr. Nilay SEZER UZOL), 9 Şubat 2021.
