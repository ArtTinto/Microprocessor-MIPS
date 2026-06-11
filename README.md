# Microprocessor-MIPS

A Microprocessor designed in MIPS architecture to execute a set of Assembly instructions. The project utilizes a circuit simulator to bring the processor design to life and make the circuit work.

## 🛠️ Prerequisites

To run and simulate this project, you will need:
* **MARS Simulator:** You can download it from the following link: [MARS Download Page](https://dpetersanderson.github.io/download.html).
* **Java Environment:** The simulator requires specific versions of Java to run. Please verify the required version, as the most recent versions of Java may not be fully compatible.

## ⚙️ Setup and Assembly Guide

Because the simulator does not package the entire circuit into a single file out of the box, **you need to manually assemble the components**:
1. Download each component from its respective folder in this repository.
2. Place them in the correct location within the main circuit.
3. Re-link the disconnected wires.

> **📖 Recommended Reference:** > To accurately reconstruct the circuit and place the components, it is highly recommended to follow the **5th Edition of Patterson & Hennessy - *Computer Organization and Design***. You can find the expected MIPS datapath circuit around page 300.

## 📂 Project Structure and Components

The project is modularized into several folders, each containing a specific component of the datapath and control unit:

### `MainProject`
Contains the primary circuit base, including the Memories and the Register File. This is the main file where all the missing components (listed below) must be manually imported and connected to their respective locations.

### `Control`
Contains the **Main Control** unit of the processor. This circuit decodes the instructions and directs the data paths. 
* **Placement:** It should be imported into the main project and placed in the large area designated for it, which has a single input wire and multiple output control wires.

### `ALUControl`
Contains the **ALU Control** unit, which dictates the specific operation the ALU will perform (e.g., Add, Subtract).
* **Placement:** It should be placed near the ALU, connecting to the currently disconnected control wires.

### `SignExtender`
Contains the **Sign Extend** component. It transforms a 16-bit Immediate value into a 32-bit value by repeating the most significant bit 16 times, maintaining the original number's sign.
* **Placement:** Needed before the ALU. It sits after the 16-bit subset (`<15:0>`) and feeds into the MUX (2-to-1) that connects to the ALU input.

### `Concatenate`
Contains the logic to concatenate the top 4 bits of `PC+4` (`<31:28>`) with the 26-bit instruction (`<25:0>`) shifted left by 2, augmenting its magnitude to a 28-bit address.
* **Usage:** Exclusively used for **J-type (Jump)** instructions.
* **Placement:** Positioned right before the MUX (2-to-1) where the other input port is `PC+4`.

### `Memory`
This folder contains the storage components of the processor:
* **Instruction Memory (ROM):** Stores the set of instructions to be executed. You can modify this to load your own custom Assembly programs.
* **Register File:** Contains the 32 standard MIPS architecture registers. *(Note: The internal data does not strictly enforce hardware-level restrictions for registers like `$pc` or `$zero`, so they can be manually altered if needed).*
* **Data Memory (RAM):** Used primarily by memory-access instructions (I-type like `lw` and `sw`). The data stored here can be modified at your own will.
