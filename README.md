# Standard Cell Library

The goal of the project is to design and characterise a small standard‑cell library using the Sky130A PDK. Each cell is designed at strength‑1 with matched rise/fall characteristics and characterised for timing and power.

## Cells implemented

Team‑19 was assigned three standard cells:

* **Inverter (X1)** – A basic CMOS inverter sized to achieve equal rise and fall transition times (\(W_n = W_{min},\;W_p = 3\times W_n\)).  
* **3‑input NAND gate** – A combinational logic gate where the drive strength and transistor widths were chosen to match the unit inverter’s delay.  
* **D flip‑flop** – A sequential edge‑triggered latch built using transmission gates and inverters.

For each cell we produced:

* **Circuit schematic** with device dimensions.
* **Magic layout** satisfying all Sky130A design rules, with the cell area reported.
* **PEX netlist** extracted from the layout.
* **DRC & LVS results** demonstrating that the layout matches the schematic.
* **Timing and power characterisation** (rise/fall delays, transition times, input pin capacitance) obtained from the parasitic netlist.
* **Verilog functional model**, **LEF**, and **LIB** files for integration in a digital flow.

## Directory structure

The project files follow the structure specified in the course problem statement【906424783122199†screenshot】:

```
Team_Number-19/
├── Spice_Netlist/
│   ├── inv.sp
│   ├── nand3.sp
│   └── dff.sp
├── LEF/
│   ├── inv.lef
│   ├── nand3.lef
│   └── dff.lef
├── Verilog/
│   ├── inv.v
│   ├── nand3.v
│   └── dff.v
├── Layout/
│   ├── inv.mag
│   ├── nand3.mag
│   └── dff.mag
├── LIB/
│   ├── inv.doc
│   ├── nand3.doc
│   └── dff.doc
└── Report/
    └── report.pdf
```

The `Spice_Netlist` folder contains the schematic netlists and post‑layout parasitic netlists. The `Layout` directory contains the Magic `.mag` files, while `LEF` and `LIB` contain the extracted LEF and characterised LIB files. Verilog functional descriptions are located in `Verilog`. The report summarising our methodology and results is in the `Report` folder.

## Methodology

We followed the prescribed sequence from the project definition【951191415932870†screenshot】:

1. **Design** the circuit in NGSpice to match the unit inverter rise/fall delay.  
2. **Draw the layout** in Magic and verify zero DRC errors and LVS pass.  
3. **Extract LEF** from the layout using `lef write` and inspect the generated file.  
4. **Timing & power characterisation** using the PEX netlist: run transient simulations across different input slews and loads to populate the `cell_rise`, `cell_fall`, `rise_transition`, `fall_transition`, and power tables.  
5. **Input pin capacitance** characterisation using ramped input sources.  
6. **HDL model**: write a Verilog description and verify syntax with `iverilog`.  

The resulting characterisations populate the `.lib` files in the `LIB` folder. See the report for detailed tables and waveforms.

## How to use

To use these cells in your design:

1. Include the LEF and LIB files in your digital synthesis and place‑and‑route tool.
2. Source the Verilog modules during synthesis.
3. Use the parasitic netlists for analog simulations if required.

Please note that this branch only contains project documentation and characterisation files; no simulation scripts are provided.
