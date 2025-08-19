# 🚀 RISC-V Core (Custom Implementation)

A custom **RISC-V processor core** designed in **Verilog** with full support for the base **RV32I instruction set**.  
The project focuses on modular architecture and extensibility, enabling future enhancements such as pipelining, hazard detection, and custom instruction extensions.  
It has been tested with assembly programs and simulation waveforms.

---

## 📌 Features
- Supports **RV32I base instruction set**:
  - R-type: Arithmetic & Logical operations  
  - I-type: Immediate operations & Loads  
  - S-type: Store instructions  
  - B-type: Branch instructions  
  - U-type: LUI/AUIPC  
  - J-type: JAL/JALR  
- Modular design:  
  - **ALU**  
  - **Register File**  
  - **Control Unit**  
  - **Instruction & Data Memory**  
- Easy to extend for:  
  - **Pipelining**  
  - **Forwarding & Hazard Detection**  
  - **Custom ISA Extensions**  

---
(https://roalogic.github.io/RV12/assets/img/RV12_Arch.png)

