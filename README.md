
```
    ________  _______  __    _____       ______
   /  _/ __ )/ ____/ |/ /   / ___/____  / ____/
   / // __  / __/  |   /    \__ \/ __ \/ /     
 _/ // /_/ / /___ /   |    ___/ / /_/ / /___   
/___/_____/_____//_/|_|   /____/\____/\____/   

```

## Project Description:
---

This is an SoC based on IBEX, a riscV based core, manifactured for for *Digital Design 2 Course @ AUC*, and to be submitted to *Google Shuttle*.

It is designed entirely using opensourse EDA tools ... the designing process is detailed in this README file


## SoC Architacture 
---

Just like the designing tools, the entire project is manfactured using opensource cores.

1. [IBEX Core](https://github.com/lowRISC/ibex)
2. AHB - APB bidge and system from [SoC GeN](https://github.com/habibagamal/SoC_Automation), discuessed in details in the tools section
3. IPs from [SoC GeN](https://github.com/habibagamal/SoC_Automation)
4.  [Caravel](https://github.com/efabless/caravel), a template SoC for Google SKY130 free shuttles

![Architacture](./image/architacture.png)



## Main Tools:
---

1. [SoC GeN](https://github.com/habibagamal/SoC_Automation)
2. [openLANE](https://github.com/efabless/openlane)


![main tools](./image/maintools.png)


## **Design Process** 
----

### **Preparing RTLs**
&nbsp;

In the [IBEX Core](https://github.com/lowRISC/ibex) repo, the entrie system is designed using SystemVerilog (IEEE 1800-2017). However, due to using iverilog and yosys for compilation and synthesis, we needed to convert it to Verilog (IEEE 1364-2005). 

Fortunately, IBEX repo includes a script to perform this conversion using [sv2v](https://github.com/zachjs/sv2v)


To perfom the conversion you would need to go to the */util* directoty inside IBEX repo. Then, you would need to insert the path of the standered cell library. In our project, in order to fit the Shuttle spacifications, we used the opensource [SKY130A](https://github.com/google/skywater-pdk) standrad cell library ... more detail on this in latter sections.

Also, our SoC is supposed to communicate with other components through AHB Bus Interface. So, we designed a **wrapper** to make our system compatible with AHB standard signals. 

---

### **Generating the SoC**
&nbsp;

Aside from IBEX core, the entire SoC is generated using [SoC GeN](https://github.com/habibagamal/SoC_Automation). In order to generate the system, a description of the systems signals must be inserted in the masters.json file in SoC Gen. Then you would need to add a description of the needed SoC and the connected subsystems. Our file is included in this repo. 

Then, you can generate the sytem using this command :

```
node ./src/sys_gen.js -soc ./systems/IBEX/Demo/demo.json -subsystem ./systems/IBEX/Demo/apb.json -IPlib ./IPs/IPs.json -mastersLib ./masters/masters.json -outDir ./IBEX/

```

Along with the generated system, [SoC GeN](https://github.com/habibagamal/SoC_Automation) generates a self checking testbench to test the entire system. in order to run them and view the result, you would need:

1. [Icarus Verilog](http://iverilog.icarus.com/)
2. [GTKwave](https://github.com/gtkwave/gtkwave)
3. Prebuilt [RISC‑V GCC Toolchain](https://www.sifive.com/software) from SiFive 


to run the testbenchs, run the following commands in order:

```
find . -name "*.v" > file.lst
iverilog -o ./ibex_system.vvp -c file.lst
vvp ibex_system.vvp
gtkwave real_dump.vcd
```

More on our test results in the test section

----
### **Hardening using OpenLANE**
&nbsp;





