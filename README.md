# Filter Circuit Computation

[![Github Action for Octave](https://github.com/micksuffolk/filter-circuit-computation/actions/workflows/octavetest.yml/badge.svg)](https://github.com/micksuffolk/filter-circuit-computation/actions/workflows/octavetest.yml)

Electrical filter transfer functions and calculations, based on standardised and widely adopted filter designs.

* [Overview](#overview)
* [Octave](#octave)
* [drawio](#drawio)
* [Filters](#filters)
    * [Terminology](#terminology)
    * [Capacitor Filter](#capacitor)
    * [Inductor (Choke) Filter](#inductor---choke)
    * [C-Type Passive Filter - CTPF](#c-type-passive-filter---ctpf)
    * [LCL Filter](#lcl-filter)
    * [Series LC Filter](#series-lc-filter)

&nbsp;



## Overview

The aim of this repository is to gather concise and useful filter design and response information which may be useful for educational or reference purposes. Most types of electrical filter designs are well documented, but it can often be difficult to find or derive a filter frequency response transfer function to get a feel for the filters characteristic behaviour.

&nbsp;



## Octave

[GNU Octave](https://github.com/gnu-octave/octave) is used _(as an alternative to [MATLAB](https://www.mathworks.com/products/matlab.html))_ for the computation of filter responses.

&nbsp;



## drawio

[drawio](https://github.com/jgraph/drawio) is used to generate the schematics and export them as SVG for embedding in web pages.

&nbsp;



## Filters


### Terminology

- Shunt filters
    - Prevent a particular frequency from entering further into a system by providing a shunt path of low impedance to the relevant frequency.
- Series filters
    - Prevent a particular frequency from entering the system by presenting a large series impedance to the relevant frequency.

&nbsp;



### Capacitor

| Feature | Comments |
| :------ | :------ |
| Reference paper(s) | Experimental Investigation of the Frequency Response of an LC-Filter and Power Transformer for Grid Connection, Christoffer Fjellstedt, Johan Forslund, Karin Thomas. DOI 10.3390/en16155784 |
| Use case(s) | Shunt filter. Filtering high order harmonics and frequencies for EMC in a power system |
| Source code | [c.m](./src/components/c.m) |

<img src="./docs/schematics/D000001_C.svg" width="450"/>

_Filter circuit_

<img src="./docs/lib/images/c.svg" width="450"/>

_Bode plot (filter impedance)_

&nbsp;



### Inductor - Choke

| Feature | Comments |
| :------ | :------ |
| Reference paper(s) | Experimental Investigation of the Frequency Response of an LC-Filter and Power Transformer for Grid Connection, Christoffer Fjellstedt, Johan Forslund, Karin Thomas. DOI 10.3390/en16155784 |
| Use case(s) | Series filter. Sine wave filtering in an AC power system. Paralleling chokes for connecting multiple drives to a single motor |
| Source code | [l.m](./src/components/l.m) |

<img src="./docs/schematics/D000001_L.svg" width="450"/>

_Filter circuit_

<img src="./docs/lib/images/l.svg" width="450"/>

_Bode plot (filter impedance)_

&nbsp;



### C-Type Passive Filter - CTPF

| Feature | Comments |
| :------ | :------ |
| Reference paper(s) | Novel Design Methodology for C-type Harmonic Filter Banks Applied in HV and EHV Networks, Randy Horton, Roger Dugan, Daryl Hallmark. DOI 10.1109/TDC.2012.6281629 |
| Use case(s) | Shunt filter. Filtering low order harmonics i.e. up to the 5th harmonic in an AC power system |
| Source code | [ctpf.m](./src/ctpf/ctpf.m) |

<img src="./docs/schematics/D000001_CTPF.svg" width="450"/>

_Filter circuit_

<img src="./docs/lib/images/ctpf.svg" width="450"/>

_Bode plot (filter impedance)_

&nbsp;



### LCL Filter

| Feature | Comments |
| :------ | :------ |
| Reference paper(s) | An Improved LCL Filter Design in Order to Ensure Stability without Damping and Despite Large Grid Impedance Variations, Marwa Ben Said-Romdhane, Mohamed Wissem Naouar, Ilhem Slama Belkhodja, and Eric Monmasson. DOI 10.3390/en10030336 |
| Use case(s) | Series filter. The main objective of the LCL filter is to reduce the high-order current harmonics at the inverter switching frequency |
| Source code | [lcl.m](./src/lcl/lcl.m) |

<img src="./docs/schematics/D000001_LCL.svg" width="450"/>

_Filter circuit_

<img src="./docs/lib/images/lcl.svg" width="450"/>

_Bode plot (filter impedance)_

&nbsp;



### Series LC Filter

| Feature | Comments |
| :------ | :------ |
| Reference paper(s) | N/A |
| Use case(s) | Shunt filter. Filtering the high-order current harmonics at the inverter switching frequency, damping resistor used to limit the magnitude of the filter response |
| Source code | [series_lc.m](./src/series/series_lc.m) |

<img src="./docs/schematics/D000001_Series_LC.svg" width="450"/>

_Filter circuit_

<img src="./docs/lib/images/series_lc.svg" width="450"/>

_Bode plot (filter impedance)_

&nbsp;


